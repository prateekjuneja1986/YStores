//
//  MainCordinator.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func setUpInitialNavigation() -> UINavigationController
    func navigateToProductDetails(_ product: ProductResponseProtocol)
    func navigateToPreviousController()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?

    func setUpInitialNavigation() -> UINavigationController {
        let productListViewController = NavigationLocator.productList.getNavigationController() as! ProductListViewController
        productListViewController.coordinator = self
        navigationController = UINavigationController(rootViewController: productListViewController)
        navigationController?.navigationBar.isHidden = true
        return navigationController!
    }

    func navigateToProductDetails(_ product: ProductResponseProtocol) {
        let productDetailViewController = NavigationLocator.productDetail(product).getNavigationController() as! ProductDetailViewController
        productDetailViewController.coordinator = self
        navigationController?.pushViewController(productDetailViewController, animated: true)
    }
    
    func navigateToPreviousController() {
        navigationController?.popViewController(animated: true)
    }
}
