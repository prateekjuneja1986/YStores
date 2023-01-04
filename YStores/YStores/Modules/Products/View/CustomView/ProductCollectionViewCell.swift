//
//  ProductCollectionViewCell.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var productTitleLabel: UILabel!
    @IBOutlet private weak var productPriceLabel: UILabel!
    @IBOutlet private weak var productImageView: UIImageView!
    
    // MARK: - Properties
    //Computed Properties
    private var loadedImage: UIImage? {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }
    //Variables
    private var product: ProductResponseProtocol!
    var viewModel: ProductCollectionViewCellViewModel?
    
    // MARK: - View Helper Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        self.productImageView.image = self.loadedImage
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImageView.image = nil
    }
    
    // MARK: - Setup UI
    func configureCell(_ product: ProductResponseProtocol?, viewModel: ProductCollectionViewCellViewModel) {
        guard let product = product else { return }
        self.product = product
        self.viewModel = viewModel
        updateImage(for: product)
        updateProductDetails(for: product)
    }
    
    private func updateProductDetails(for product: ProductResponseProtocol) {
        productTitleLabel.text = product.title
        productPriceLabel.text = product.formattedPrice
    }
    
    
    private func updateImage(for product: ProductResponseProtocol) {
        guard let imageURL = URL(string: product.thumbnail ?? "") else { return }
        Task {
            do {
                self.loadedImage = try await self.viewModel?.loadImage(for: imageURL)
            } catch {
                self.loadedImage = UIImage(named: "ProductPlaceholder")
            }
        }
    }
}
