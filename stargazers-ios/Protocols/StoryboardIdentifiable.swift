//
//  StoryboardIdentifiable.swift
//  stargazers-ios
//
//  Created by Alberto Longo on 17/10/21.
//

import Foundation
import UIKit


protocol StoryboardIdentifiable {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static func instantiateFromStoryboard() -> Self {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(identifier: storyboardIdentifier)
    }
}
