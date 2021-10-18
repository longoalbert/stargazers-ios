//
//  MainCoordinator.swift
//  stargazers-ios
//
//  Created by Alberto Longo on 17/10/21.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func stargazersList(for repositoryName: String, of user: String) {
        let viewController = StargazersListTableTableViewController.instantiateFromStoryboard()
        viewController.coordinator = self
        viewController.ownerName = user
        viewController.repositoryName = repositoryName
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
