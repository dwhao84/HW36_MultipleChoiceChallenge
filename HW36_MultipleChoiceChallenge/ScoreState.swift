//
//  ScoreState.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import UIKit

enum ScoreState {
    case start
    case wrong
    case correct

    var status: String {
        switch self {
            case.start:
                return "Just start!"
            case.correct:
                return "You're correct!"
            case .wrong:
                return "You're wrong"
        }
    }
}

