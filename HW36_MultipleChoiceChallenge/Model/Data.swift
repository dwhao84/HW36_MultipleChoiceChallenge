//
//  Data.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import UIKit
import CodableCSV

struct MultipleChoiceData: Codable {
    var question   : String?
    var answerOne  : String?
    var answerTwo  : String?
    var answerThree: String?
    var answerFour : String?
    var correctAnswer: String?

    // Computed property
    func isAnswerCorrect(_ answer: String) -> Bool {
        print("isAnswerCorrect")
        return answer == correctAnswer
    }
}

extension MultipleChoiceData {
    static var data: [Self] {
        var array = [Self]()
        if let data = NSDataAsset(name: "MultiChoice_question-Grid view")?.data {
            let decoder = CSVDecoder {
                $0.headerStrategy = .firstLine
            }
            do {
                array = try decoder.decode([Self].self, from: data)
            } catch {
                print("Error decoding CSV data: \(error)")
            }
        } else {
            print("Error loading NSDataAsset")
        }
        return array
    }
}
//
//func getRandomQuestion () -> MultipleChoiceData? {
//    return MultipleChoiceData.data.shuffled().randomElement()
//}
