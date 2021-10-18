//
//  StargazersListTableTableViewController.swift
//  stargazers-ios
//
//  Created by Alberto Longo on 17/10/21.
//

import UIKit
import Alamofire
import Kingfisher


class StargazersListTableTableViewController: UITableViewController, StoryboardIdentifiable {

    static var storyboardName: String = "Main"
    
    weak var coordinator: MainCoordinator?
    
    var ownerName: String!
    var repositoryName: String!
    
    private var stargazers = Array<Stargazer>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = repositoryName
        navigationItem.prompt = ownerName
        
        fetchStargazersList()
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stargazers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StargazerTableViewCell.identifier, for: indexPath) as? StargazerTableViewCell else {
            fatalError("Wrong cell type dequeued")
        }
        
        let stargazer = stargazers[indexPath.row]

        cell.userAvatarImageView.kf.setImage(with: URL(string: stargazer.avatarUrl))
        cell.userNameLabel.text = stargazer.login
        
        return cell
    }

    private func fetchStargazersList() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let requestUrl = String(format: "https://api.github.com/repos/%@/%@/stargazers", ownerName, repositoryName)
        
        AF.request(requestUrl).responseDecodable(of: [StargazerDTO].self, decoder: decoder) { [weak self] response in
            guard let stargazers = response.value else { return }
            
            self?.stargazers.append(contentsOf: stargazers.map { $0.toDomainModel() })
        
            self?.tableView.reloadData()
        }
    }

}
