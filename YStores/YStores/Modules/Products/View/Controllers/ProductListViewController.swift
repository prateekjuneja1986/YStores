//
//  ProductListViewController.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import UIKit
import Combine

class ProductListViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    // MARK: - Properties
    // Variables
    var viewModel: ProductViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        bindControls()
        loadAllProducts()
    }
    
    // MARK: - Setup methods
    func registerCustomCell() {
        productCollectionView.register(UINib(nibName: ProductCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    
    // MARK: - Helper methods
    func bindControls() {
        bindDataSource()
        bindActivityIndicator()
        bindErrorHandle()
    }
    
    func bindDataSource() {
        viewModel?.$products
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                self?.productCollectionView.reloadData()
            }.store(in: &cancellables)
    }
    
    func bindActivityIndicator() {
        viewModel?.$isDataLoading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] loading in
                if loading {
                    self?.startIndicatorAnimating()
                } else {
                    self?.stopIndicatorAnimating()
                }
            }.store(in: &cancellables)
    }
    
    func bindErrorHandle() {
        viewModel?.$error
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                if let err = error {
                    self?.handleError(err)
                }
            }.store(in: &cancellables)
    }
    
    // MARK: - Data Source methods
    func loadAllProducts() {
        Task {
            try await viewModel?.loadAllProducts()
        }
    }
    
}


// MARK: - CollectionView Delegates & DataSource methods
extension ProductListViewController: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let productCount = self.viewModel?.getProductsCount() else {
            return 0
        }
        return productCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier,
                                                            for: indexPath) as? ProductCollectionViewCell,
              let product = viewModel?.getProducts(for: indexPath) else {
            return UICollectionViewCell()
        }
        cell.configureCell(product,viewModel: ProductCollectionViewCellViewModel())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / CGFloat(CollectionViewDimensions.noOfColumnsRequired.rawValue)
        return CGSize(width: size, height: CGFloat(CollectionViewDimensions.cellheight.rawValue))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = viewModel?.getProducts(for: indexPath) else {return}
        // Navigate to Product Details
        coordinator?.navigateToProductDetails(product)
    }
}


