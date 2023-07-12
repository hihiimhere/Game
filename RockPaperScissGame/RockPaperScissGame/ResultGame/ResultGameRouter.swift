//
//  ResultGameRouter.swift
//  RockPaperScissGame
//
//  Created by Athapong.Kor on 10/7/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol ResultGameRouterInput {
    
}

protocol ResultGameRouterDataSource: class {
    
}

protocol ResultGameRouterDataDestination: class {
    var result: String {get set}
}

class ResultGameRouter: ResultGameRouterInput {
    
    weak var viewController: ResultGameViewController!
    weak private var dataSource: ResultGameRouterDataSource!
    weak var dataDestination: ResultGameRouterDataDestination!
    
    init(viewController: ResultGameViewController, dataSource: ResultGameRouterDataSource, dataDestination: ResultGameRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
}