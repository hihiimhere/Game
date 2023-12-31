//
//  ResultGameConfigurator.swift
//  RockPaperScissGame
//
//  Created by Athapong.Kor on 10/7/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension ResultGameInteractor: ResultGameViewControllerOutput, ResultGameRouterDataSource, ResultGameRouterDataDestination {
    
}

extension ResultGamePresenter: ResultGameInteractorOutput {
    
}

class ResultGameConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = ResultGameConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: ResultGameViewController) {
        
        let presenter = ResultGamePresenter()
        presenter.output = viewController
        
        let interactor = ResultGameInteractor()
        interactor.output = presenter
        
        let router = ResultGameRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
