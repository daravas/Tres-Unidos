//
//  AppCoordinator.swift
//  Tres Unidos
//
//  Created by Dara Caroline on 17/11/21.
//  Copyright © 2021 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }

    func start()
    
}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController = ViewController()
        firstViewController.coordinator = self
        self.navigationController.pushViewController(firstViewController, animated: true)
    }
    
    func showSongVc(){
        let songViewController = SongViewController()
        songViewController.coordinator = self
        self.navigationController.pushViewController(songViewController, animated: true)
    }
    
    
    
    
}
