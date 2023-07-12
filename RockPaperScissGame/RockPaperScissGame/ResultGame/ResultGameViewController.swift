//
//  ResultGameViewController.swift
//  RockPaperScissGame
//
//  Created by Athapong.Kor on 10/7/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol ResultGameViewControllerInput {
    
}

protocol ResultGameViewControllerOutput {
    func showResult()
}

class ResultGameViewController: UIViewController, ResultGameViewControllerInput {
    
    @IBOutlet weak var resultGame: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    var output: ResultGameViewControllerOutput?
    var router: ResultGameRouter?
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ResultGameConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.showResult()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("result 1 \(router?.dataDestination.result)")
    }
    // MARK: Requests
    
    
    // MARK: Display logic
    func showResult(_ result: String) {
        resultGame.text = result
    }
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension ResultGameViewController: ResultGamePresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}