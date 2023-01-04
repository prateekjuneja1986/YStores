//
//  SceneDelegate.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        if UIDevice.current.isJailBroken { // If device is jailbroke then exit from the app
                exit(0)
        } else {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            coordinator = MainCoordinator()
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = coordinator?.setUpInitialNavigation()
            window?.makeKeyAndVisible()
        }
    }

    


}

