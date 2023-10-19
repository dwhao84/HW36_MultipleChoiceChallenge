//
//  ScoreState.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import Foundation

enum ScoreState {
    case wrong
    case correct

    var status: String {
        switch self {
            case.correct:
                return "You're correct!"
            case .wrong:
                return "You're wrong"
        }
    }

    func updateUI(status: ScoreState) {

    }
}

