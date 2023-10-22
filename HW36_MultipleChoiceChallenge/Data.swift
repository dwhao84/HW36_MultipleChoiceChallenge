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
}

extension MultipleChoiceData {
    static var data: [Self] {
        var array = [Self]()
        if let data = NSDataAsset(name: "MultiChoice_question")?.data {
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


//var questionsAndAnswers: [MultipleChoiceData] = [
//    MultipleChoiceData(question: "Who co-founded Apple Inc. alongside Steve Jobs in 1976?", answerOne: "Steve Wozniak", answerTwo: "Bill Gates", answerThree: "Elon Musk", answerFour: "Larry Page", correctAnswer: "Steve Wozniak"),
//
//    MultipleChoiceData(question: "In which city and state is Apple's headquarters, commonly known as the \"Spaceship,\" located?", answerOne: "Cupertino, California", answerTwo: "Palo Alto, California", answerThree: "Seattle, Washington", answerFour: "Mountain View, California", correctAnswer: "Cupertino, California"),
//
//    MultipleChoiceData(question: "What was the name of Apple's first commercially sold computer?", answerOne: "Apple I", answerTwo: "Apple II", answerThree: "Macintosh", answerFour: "iMac", correctAnswer: "Apple I"),
//
//    MultipleChoiceData(question: "Which operating system powers Apple's Mac computers?", answerOne: " macOS", answerTwo: "Windows", answerThree: " Linux", answerFour: "iOS", correctAnswer: "macOS"),
//
//    MultipleChoiceData(question: "Who succeeded Steve Jobs as CEO of Apple Inc.?", answerOne: "Tim Cook", answerTwo: "Phil Schiller", answerThree: " Jonathan Ive", answerFour: "Mark Zuckerberg", correctAnswer: "Tim Cook"),
//
//    MultipleChoiceData(question: "What is the name of Apple's retail stores, which can be found globally?", answerOne: "Apple Store", answerTwo: "iStore", answerThree: "Mac Shop", answerFour: "Apple Hub", correctAnswer: "Apple Store"),
//
//    MultipleChoiceData(question: "Which annual event does Apple host to introduce new software and sometimes hardware products?", answerOne: "Worldwide Developers Conference (WWDC)", answerTwo: "Apple Keynote", answerThree: "Macworld Expo", answerFour: "Apple Fest", correctAnswer: "Worldwide Developers Conference (WWDC)"),
//
//    MultipleChoiceData(question: "What service did Apple introduce in 2019 as its foray into the video streaming industry?", answerOne: "Apple TV+", answerTwo: "iStream", answerThree: "MacMovies", answerFour: "Apple Flix", correctAnswer: "Apple TV+"),
//
//    MultipleChoiceData(question: "What programming language did Apple introduce in 2014 to develop apps for its devices?", answerOne: "Swift", answerTwo: "Java", answerThree: "C++", answerFour: "Ruby", correctAnswer: "Swift"),
//
//    MultipleChoiceData(question: "What is the name of Apple's wireless earbuds that were first released in 2016?", answerOne: "AirPods", answerTwo: "iBuds", answerThree: "AppleTunes", answerFour: "NanoBuds", correctAnswer: "AirPods"),
//
//    MultipleChoiceData(question: "Which Apple product is a digital assistant activated by the phrase \"Hey Siri\"?", answerOne: "iPhone, iPad, and Mac.", answerTwo: "Cortana", answerThree: "Bixby", answerFour: "Alexa", correctAnswer: "iPhone, iPad, and Mac."),
//
//    MultipleChoiceData(question: "In which decade was the iPod, a portable music player, first introduced by Apple?", answerOne: "2000s", answerTwo: "1980s", answerThree: "2010s", answerFour: "1990s", correctAnswer: "2000s"),
//
//    MultipleChoiceData(question: "Which Apple service provides cloud storage and synchronization for user data such as photos, documents, and contacts?", answerOne: "iCloud", answerTwo: "iDrive", answerThree: "AppleBox", answerFour: "MacCloud", correctAnswer: "iCloud")
//]
