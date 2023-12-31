//
//  PlayGameInteractor.swift
//  RockPaperScissGame
//
//  Created by Athapong.Kor on 6/7/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import Foundation

protocol PlayGameInteractorInput {
    func play(request: PlayGameScene.validationResult.Request)
    func getResult()
}

protocol PlayGameInteractorOutput {
    func showCompPlay(response: PlayGameScene.validationResult.Response)
    func showResult()
}

protocol PlayGameDataSource {
    var result: String {get set}
}

protocol PlayGameDataDestination {
    
}

class PlayGameInteractor: PlayGameInteractorInput, PlayGameDataSource, PlayGameDataDestination {
    
    var output: PlayGameInteractorOutput?
    var computerPlay: String = ""
    var player: String = ""
    var result: String = ""
    private var isSelected = false
    
    // MARK: Business logic
    var choice: PlayGameScene.Choices? = nil
    
}

extension PlayGameInteractor {
    //Input
    func play(request: PlayGameScene.validationResult.Request) {
        switch request.playerResult {
        case 0: choice = .rock
        case 1: choice = .paper
        case 2: choice = .scissors
        default: break
        }
        isSelected.toggle()
        print(request.playerResult)
        
        guard let choices = choice else { return }
        let player1 = choices.getChoices()
        player = player1
        print(player1)
        
        let computer = choices.randomComputerChoice()
        computerPlay = computer
        let response = PlayGameScene.validationResult.Response(computerPlay: computerPlay)
        output?.showCompPlay(response: response)
        print(computerPlay)
        getResult()
    }
    
    func getResult() {
        self.result = determineGameResult(PlayGameScene.Choices(rawValue: player)!, PlayGameScene.Choices(rawValue: computerPlay)!)
        print(determineGameResult(PlayGameScene.Choices(rawValue: player)!, PlayGameScene.Choices(rawValue: computerPlay)!))
        output?.showResult()
    }
}

extension PlayGameInteractor {
    func determineGameResult(_ player: PlayGameScene.Choices, _ computerPlay: PlayGameScene.Choices) -> String {
        if  player == computerPlay {
            return "player1: \(player), computer: \(computerPlay) -> DRAW!"
        } else if player == .rock && computerPlay == .scissors {
            return "player1: \(player), computer: \(computerPlay) -> PLAYER1 WIN!"
        } else if player == .paper && computerPlay == .rock {
            return "player1: \(player), computer: \(computerPlay) -> PLAYER1 WIN!"
        } else if player == .scissors && computerPlay == .paper {
            return "player1: \(player), computer: \(computerPlay) -> PLAYER1 WIN!"
        } else {return "computer WIN!"}
    }
}
