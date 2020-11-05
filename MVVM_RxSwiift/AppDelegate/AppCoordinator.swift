//
//  AppCoordinator.swift
//  MVVM_RxSwiift
//
//  Created by Alan Silva on 03/11/20.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
       
        let viewController = ViewController.instantiate(viewModel: RestaurantListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
       
    }
    
}
