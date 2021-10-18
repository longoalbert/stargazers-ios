//
//  Coordinator.swift
//  stargazers-ios
//
//  Created by Alberto Longo on 17/10/21.
//

import Foundation
import UIKit


protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
