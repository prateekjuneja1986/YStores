//
//  UIImageView.swift
//  YStores
//
//  Created by Prateek Juneja on 04/01/23.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(imageURL: URL, placeHolder: String = "ProductPlaceholder") {
        Task {
            do {
                self.renderImage(toImage: try await ImageLoader.shared.loadImage(for: imageURL))
            } catch {
                self.image = UIImage(named: placeHolder)
            }
        }
    }
    
    func renderImage(toImage image: UIImage?) {
        UIView.transition(with: self, duration: 0.3, options: [.transitionCrossDissolve]) {
            self.image = image
        }
    }
}
