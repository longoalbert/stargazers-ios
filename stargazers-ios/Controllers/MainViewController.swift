//
//  MainViewController.swift
//  stargazers-ios
//
//  Created by Alberto Longo on 17/10/21.
//

import UIKit


class MainViewController: UIViewController, StoryboardIdentifiable {
    
    static var storyboardName: String = "Main"

    @IBOutlet weak var ownerNameLabel: UITextField!
    @IBOutlet weak var repositoryNameLabel: UITextField!
    
    weak var coordinator: MainCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @IBAction func continueDidClick() {
        guard let ownerName = ownerNameLabel.text, !ownerName.isEmpty else { return }
        guard let repositoryName = repositoryNameLabel.text, !repositoryName.isEmpty else { return }
        
        coordinator?.stargazersList(for: repositoryName, of: ownerName)
    }
    
}
