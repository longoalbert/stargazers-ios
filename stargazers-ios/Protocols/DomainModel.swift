//
//  DomainModel.swift
//  stargazers-ios
//
//  Created by Alberto Longo on 17/10/21.
//

import Foundation


protocol DomainModel {
    associatedtype DomainModelType
    func toDomainModel() -> DomainModelType
}
