//
//  SceneDelegate.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 28/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        self.coordinator = AppCoordinator(navigationController: navigationController)
        self.coordinator?.start()
        
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        window?.windowScene = windowScene
    }

 


}

