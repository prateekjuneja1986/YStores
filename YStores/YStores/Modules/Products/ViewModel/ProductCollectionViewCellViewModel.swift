//
//  ProductCollectionViewCellViewModel.swift
//  YStores
//
//  Created by Prateek Juneja on 02/01/23.
//

import Foundation
import UIKit

class ProductCollectionViewCellViewModel {
    
    func loadImage(for imageURL: URL) async throws -> UIImage {
        return try await ImageLoader.shared.loadImage(for: imageURL)
    }
}
