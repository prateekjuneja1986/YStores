//
//  ProductDetailViewController.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import UIKit

class ProductDetailViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var productTitleLabel: UILabel!
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productDescriptionLabel: UILabel!
    @IBOutlet private weak var productPriceLabel: UILabel!
    
    // MARK: - Properties
    // Variables
    var viewModel: ProductDetailViewModel?
    
    // MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    // MARK: - Setup methods
    private func setUpUI() {
        self.renderProductInformationToUI()
        self.loadProductImage()
    }
    
    private func renderProductInformationToUI() {
        guard let productDetails = viewModel?.product else {return}
        productTitleLabel.text = productDetails.title
        productPriceLabel.text = productDetails.formattedPrice
        productDescriptionLabel.text = productDetails.productDescription
    }
    
    private func loadProductImage() {
        guard let imageURL = URL(string: viewModel?.product.thumbnail ?? "") else { return }
        self.productImageView.loadImage(imageURL: imageURL)
    }
    
    
    // MARK: - Action Outlets
    @IBAction func backButtonPressed(_ sender: Any) {
        coordinator?.navigateToPreviousController()
    }
}

