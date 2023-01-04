//
//  NavigationLocator.swift
//  YStores
//
//  Created by Prateek Juneja on 23/12/22.
//

import Foundation
import UIKit

enum NavigationLocator {
    
    case productList
    case productDetail(_ product: ProductResponseProtocol)
    
    func getStoryboardWithName(appStoryboard: AppStoryboards) -> UIStoryboard {
        return UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
    }
    
    func getNavigationController() -> UIViewController {
        let storyBoard = self.getStoryboardWithName(appStoryboard: .main)
        switch self {
        case .productList:
            let productListViewController = ProductListViewController.instantiate(storyboard: storyBoard)
            as! ProductListViewController
            productListViewController.viewModel = ProductViewModel(productAPIService: ProductAPIService())
            return productListViewController
        case .productDetail(let product):
            let productDetailViewController = ProductDetailViewController.instantiate(storyboard: storyBoard)
            as! ProductDetailViewController
            productDetailViewController.viewModel = ProductDetailViewModel(product: product)
            return productDetailViewController
        }
    }
}
