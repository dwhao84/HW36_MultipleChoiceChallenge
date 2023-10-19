//
//  MultipleChoiceViewController.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    let answerButtonOne    = UIButton()
    let answerButtonTwo    = UIButton()
    let answerButtonThree  = UIButton()
    let answerButtonFour   = UIButton()

    let questionImageView = UIImageView()

    let questionTitleLabel       = UILabel() // Ex: How many sexy girl in Taiwan?
    let questionStatusTitleLabel = UILabel() // Which question are we on. Ex: question number 10.

    let progressView = UIProgressView()

    override func viewDidLoad() {
        super.viewDidLoad()

     updateUI()

    }


    func updateUI () {
        self.view.backgroundColor = UIColor.black

        // answer
        answerButtonOne.frame   = CGRect(x: 51, y: 475, width: 325, height: 50)
        answerButtonOne.tintColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonOne.titleLabel?.text = "1"

        answerButtonTwo.frame   = CGRect(x: 51, y: 538, width: 325, height: 50)
        answerButtonTwo.tintColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonTwo.titleLabel?.text = "2"

        answerButtonThree.frame = CGRect(x: 51, y: 603, width: 325, height: 50)
        answerButtonThree.tintColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonThree.titleLabel?.text = "3"

        answerButtonFour.frame  = CGRect(x: 51, y: 667, width: 325, height: 50)
        answerButtonFour.tintColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonFour.titleLabel?.text = "4"

        // progressView
        progressView.frame     = CGRect(x: 51, y: 795, width: 325, height: 5)
        progressView.tintColor = UIColor.systemGreen
        view.addSubview(progressView)
        
    }

    func randomShowQuestion () {
        let randomNumber = Int.random(in: 0...3)

    }



}
