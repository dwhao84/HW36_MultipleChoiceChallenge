//
//  MultipleChoiceViewController.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    let answerButtonOne    = UIButton(type: .system)
    let answerButtonTwo    = UIButton(type: .system)
    let answerButtonThree  = UIButton(type: .system)
    let answerButtonFour   = UIButton(type: .system)

    let backwardButton = UIButton(type: .system)
    let forwardButton  = UIButton(type: .system)

    let questionImageView = UIImageView()

    let questionTitleLabel       = UILabel() // Ex: How many sexy girl in Taiwan?
    let questionStatusTitleLabel = UILabel() // Which question are we on. Ex: question number 10.

    let welcomeTitleLabel    = UILabel()
    let questionContentLabel = UILabel()

    let progressView = UIProgressView()

    var userNameText: String?
    var questionNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()

     updateUI()
     print("MulitpleVC")

    }

// MARK: - configure UI
    func updateUI () {
        self.view.backgroundColor = UIColor.black

        let cornerRadius: CGFloat = 5.0

        // answerButton series
        answerButtonOne.frame   = CGRect(x: 51, y: 475, width: 325, height: 50)
        answerButtonOne.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonOne.setTitle("1", for: .normal)
        answerButtonOne.tintColor = UIColor.lightGray
        answerButtonOne.isHidden = false
        answerButtonOne.layer.cornerRadius = cornerRadius
        answerButtonOne.clipsToBounds = true
        answerButtonOne.addTarget(self, action: #selector(didTapAnswerButtonOne), for: .touchUpInside)
        view.addSubview(answerButtonOne)

        answerButtonTwo.frame   = CGRect(x: 51, y: 538, width: 325, height: 50)
        answerButtonTwo.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonTwo.setTitle("2", for: .normal)
        answerButtonTwo.tintColor = UIColor.lightGray
        answerButtonTwo.isHidden = false
        answerButtonTwo.layer.cornerRadius = cornerRadius
        answerButtonTwo.clipsToBounds = true
        answerButtonTwo.addTarget(self, action: #selector(didTapAnswerButtonTwo), for: .touchUpInside)
        view.addSubview(answerButtonTwo)

        answerButtonThree.frame = CGRect(x: 51, y: 603, width: 325, height: 50)
        answerButtonThree.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonThree.setTitle("3", for: .normal)
        answerButtonThree.tintColor = UIColor.lightGray
        answerButtonThree.isHidden = false
        answerButtonThree.layer.cornerRadius = cornerRadius
        answerButtonThree.clipsToBounds = true
        answerButtonThree.addTarget(self, action: #selector(didTapAnswerButtonThree), for: .touchUpInside)
        view.addSubview(answerButtonThree)

        answerButtonFour.frame  = CGRect(x: 51, y: 667, width: 325, height: 50)
        answerButtonFour.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonFour.setTitle("4", for: .normal)
        answerButtonFour.tintColor = UIColor.lightGray
        answerButtonFour.isHidden = false
        answerButtonFour.layer.cornerRadius = cornerRadius
        answerButtonFour.clipsToBounds = true
        answerButtonFour.addTarget(self, action: #selector(didTapAnswerButtonFour), for: .touchUpInside)
        view.addSubview(answerButtonFour)

        // forwardButton
        let configuration = UIImage.SymbolConfiguration(pointSize: 45, weight: .bold)
        let forwardImageSymbol = UIImage(systemName: "arrow.right.circle.fill", withConfiguration: configuration)
        forwardButton.setImage(forwardImageSymbol, for: .normal)
        forwardButton.frame = CGRect(x: 317, y: 818, width: 60, height: 60)
        forwardButton.setTitleColor(UIColor.white, for: .normal)
        forwardButton.tintColor = UIColor.systemGreen
        forwardButton.isHidden = false
        view.addSubview(forwardButton)

        // backwardButton
        let backwardConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let backwardImageSymbol = UIImage(systemName: "arrow.left", withConfiguration: backwardConfiguration)
        backwardButton.setImage(backwardImageSymbol, for: .normal)
        backwardButton.frame = CGRect(x: 41, y: 826, width: 45, height: 45)
        backwardButton.setTitleColor(UIColor.white, for: .normal)
        backwardButton.tintColor = UIColor.systemGreen
        backwardButton.isHidden = false
        view.addSubview(backwardButton)

        // progressView
        progressView.frame     = CGRect(x: 51, y: 795, width: 325, height: 5)
        progressView.progress = 0.1
        progressView.tintColor = UIColor.systemGreen
        view.addSubview(progressView)

        welcomeTitleLabel.frame = CGRect(x: 51, y: 52, width: 326, height: 80)
        welcomeTitleLabel.text = "Welcome to \(userNameText ?? "")"
        welcomeTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        welcomeTitleLabel.textColor = UIColor.white
        welcomeTitleLabel.textAlignment = .left
        welcomeTitleLabel.numberOfLines = 1
        welcomeTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(welcomeTitleLabel)

        questionContentLabel.frame = CGRect(x: 51, y: 130, width: 124, height: 30)
        questionContentLabel.text = "Question\(questionNumber)"
        questionContentLabel.font = UIFont.systemFont(ofSize: 25)
        questionContentLabel.textColor = UIColor.white
        questionContentLabel.textAlignment = .left
        questionContentLabel.numberOfLines = 1
        questionContentLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionContentLabel)

        questionStatusTitleLabel.frame = CGRect(x: 51, y: 754, width: 135, height: 20)
        questionStatusTitleLabel.text = "Question 1 / 10"
        questionStatusTitleLabel.font = UIFont.systemFont(ofSize: 19)
        questionStatusTitleLabel.textColor = UIColor.lightGray
        questionStatusTitleLabel.textAlignment = .left
        questionStatusTitleLabel.numberOfLines = 1
        questionStatusTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionStatusTitleLabel)

        questionContentLabel.frame = CGRect(x: 51, y: 130, width: 124, height: 30)
        questionContentLabel.text = "Question\(questionNumber)"
        questionContentLabel.font = UIFont.systemFont(ofSize: 25)
        questionContentLabel.textColor = UIColor.white
        questionContentLabel.textAlignment = .left
        questionContentLabel.numberOfLines = 1
        questionContentLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionContentLabel)
    }

    func randomShowQuestion () {
//        let randomNumber = Int.random(in: 0...3)

    }

    @objc func didTapAnswerButtonOne () {
      print("didTapAnswerButtonOne")
    }

    @objc func didTapAnswerButtonTwo () {
     print("didTapAnswerButtonTwo")
    }

    @objc func didTapAnswerButtonThree () {
     print("didTapAnswerButtonThree")
    }

    @objc func didTapAnswerButtonFour () {
     print("didTapAnswerButtonFour")
    }








}
