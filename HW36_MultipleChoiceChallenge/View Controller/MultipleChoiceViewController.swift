//
//  MultipleChoiceViewController.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import UIKit
import CodableCSV

class MultipleChoiceViewController: UIViewController, UITextViewDelegate {

    let answerButtonOne    = UIButton(type: .system)
    let answerButtonTwo    = UIButton(type: .system)
    let answerButtonThree  = UIButton(type: .system)
    let answerButtonFour   = UIButton(type: .system)

    let backwardButton = UIButton(type: .system)
    let forwardButton  = UIButton(type: .system)

    let questionTitleLabel       = UILabel() // Ex: How many sexy girl in Taiwan?
    let questionStatusTitleLabel = UILabel() // Which question are we on. Ex: question number 10.

    let welcomeTitleLabel    = UILabel()
    let questionContentLabel = UILabel()

    let progressView = UIProgressView()

    var userNameText: String?

    var questionNumber = 1
    var progressValue: CGFloat = 0

    // Create an variable for initial score calculated for gameRound.
    var score: Int = 0


    var index: Int = 0

    // Create an instance called questionSet from MultipleChoiceData.
    let questionSet = MultipleChoiceData.data

    // Create an answerView content:
    let answerView = UIView()
    let correctAnswerImageView = UIImageView()
    let introductionTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        gameRoundTextUpdate ()
        print("MulitpleVC")
        print(progressValue)
        print(questionSet)

    }

    // MARK: - configure UI
    func updateUI () {
        self.view.backgroundColor = UIColor.black

        let cornerRadiusValue: CGFloat = 5.0

        randomShowQuestion()

        // answerButton series
        answerButtonOne.frame   = CGRect(x: 51, y: 475, width: 325, height: 50)
        answerButtonOne.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonOne.setTitle(questionSet[0].answerOne, for: .normal)
        answerButtonOne.tintColor = UIColor.lightGray
        answerButtonOne.isHidden = false
        answerButtonOne.layer.cornerRadius = cornerRadiusValue
        answerButtonOne.clipsToBounds = true
        answerButtonOne.addTarget(self, action: #selector(didTapAnswerButtonOne), for: .touchUpInside)
        view.addSubview(answerButtonOne)

        answerButtonTwo.frame   = CGRect(x: 51, y: 538, width: 325, height: 50)
        answerButtonTwo.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonTwo.setTitle(questionSet[0].answerTwo, for: .normal)
        answerButtonTwo.tintColor = UIColor.lightGray
        answerButtonTwo.isHidden = false
        answerButtonTwo.layer.cornerRadius = cornerRadiusValue
        answerButtonTwo.clipsToBounds = true
        answerButtonTwo.addTarget(self, action: #selector(didTapAnswerButtonTwo), for: .touchUpInside)
        view.addSubview(answerButtonTwo)

        answerButtonThree.frame = CGRect(x: 51, y: 603, width: 325, height: 50)
        answerButtonThree.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonThree.setTitle(questionSet[0].answerThree, for: .normal)
        answerButtonThree.tintColor = UIColor.lightGray
        answerButtonThree.isHidden = false
        answerButtonThree.layer.cornerRadius = cornerRadiusValue
        answerButtonThree.clipsToBounds = true
        answerButtonThree.addTarget(self, action: #selector(didTapAnswerButtonThree), for: .touchUpInside)
        view.addSubview(answerButtonThree)

        answerButtonFour.frame  = CGRect(x: 51, y: 667, width: 325, height: 50)
        answerButtonFour.backgroundColor = UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1)
        answerButtonFour.setTitle(questionSet[0].answerFour, for: .normal)
        answerButtonFour.tintColor = UIColor.lightGray
        answerButtonFour.isHidden = false
        answerButtonFour.layer.cornerRadius = cornerRadiusValue
        answerButtonFour.clipsToBounds = true
        answerButtonFour.addTarget(self, action: #selector(didTapAnswerButtonFour), for: .touchUpInside)
        view.addSubview(answerButtonFour)

        // forwardButton 往前
        let configuration = UIImage.SymbolConfiguration(pointSize: 45, weight: .bold)
        let forwardImageSymbol = UIImage(systemName: "arrow.right.circle.fill", withConfiguration: configuration)
        forwardButton.setImage(forwardImageSymbol, for: .normal)
        forwardButton.frame = CGRect(x: 317, y: 818, width: 60, height: 60)
        forwardButton.setTitleColor(UIColor.white, for: .normal)
        forwardButton.tintColor = UIColor.systemGreen
        forwardButton.isHidden = false
        forwardButton.addTarget(self, action: #selector(didTapForwardButton), for: .touchUpInside)
        view.addSubview(forwardButton)

        // backwardButton 往後
        let backwardConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        let backwardImageSymbol = UIImage(systemName: "arrow.left", withConfiguration: backwardConfiguration)
        backwardButton.setImage(backwardImageSymbol, for: .normal)
        backwardButton.frame = CGRect(x: 41, y: 826, width: 45, height: 45)
        backwardButton.setTitleColor(UIColor.white, for: .normal)
        backwardButton.tintColor = UIColor.systemGreen
        backwardButton.isHidden = false
        backwardButton.addTarget(self, action: #selector(didTapBackwardButton), for: .touchUpInside)
        view.addSubview(backwardButton)


        welcomeTitleLabel.frame = CGRect(x: 51, y: 52, width: 326, height: 80)
        welcomeTitleLabel.text = "Welcome \(userNameText ?? "")"
        welcomeTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        welcomeTitleLabel.textColor = UIColor.white
        welcomeTitleLabel.textAlignment = .left
        welcomeTitleLabel.numberOfLines = 1
        welcomeTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(welcomeTitleLabel)

        questionTitleLabel.frame = CGRect(x: 51, y: 150, width: 325, height: 270)
        questionTitleLabel.text = questionSet[0].question
        questionTitleLabel.font = UIFont.systemFont(ofSize: 20)
        questionTitleLabel.textColor = UIColor.white
        questionTitleLabel.textAlignment = .left
        questionTitleLabel.numberOfLines = 4
        questionTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionTitleLabel)

        questionContentLabel.frame = CGRect(x: 51, y: 130, width: 124, height: 30)
        questionContentLabel.text = "Question\(questionNumber)"
        questionContentLabel.font = UIFont.systemFont(ofSize: 25)
        questionContentLabel.textColor = UIColor.white
        questionContentLabel.textAlignment = .left
        questionContentLabel.numberOfLines = 1
        questionContentLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionContentLabel)

        questionStatusTitleLabel.frame = CGRect(x: 51, y: 754, width: 135, height: 20)
        questionStatusTitleLabel.text = "Question \(Int(progressValue * 10)) / 10"
        questionStatusTitleLabel.font = UIFont.systemFont(ofSize: 19)
        questionStatusTitleLabel.textColor = UIColor.lightGray
        questionStatusTitleLabel.textAlignment = .left
        questionStatusTitleLabel.numberOfLines = 1
        questionStatusTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionStatusTitleLabel)

        // progressView
        progressView.frame  = CGRect(x: 51, y: 795, width: 325, height: 5)
        progressView.progress = Float(progressValue / 10)

        progressView.tintColor = UIColor.systemGreen
        view.addSubview(progressView)
    }

    func randomShowQuestion () {
        let randomNumber = Int.random(in: 0...12)
    }

    func gameRoundTextUpdate () {
        progressView.setProgress(Float((progressValue ) / 10), animated: true)
        questionStatusTitleLabel.text = "Question \(Int(progressValue)) / 10"
    }

    func showAnswerView () {
        let cornerRadiusValue: CGFloat = 10.0
        let imageViewCornerRadiusValue: CGFloat = 1
        answerView.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        answerView.layer.cornerRadius = cornerRadiusValue
        answerView.clipsToBounds = true
        view.addSubview(answerView)

        print("Into the answerView")

        answerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            answerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            answerView.widthAnchor.constraint(equalToConstant: 300),
            answerView.heightAnchor.constraint(equalToConstant: 600)
        ])

        correctAnswerImageView.image = UIImage(named: "")
        correctAnswerImageView.layer.cornerRadius = imageViewCornerRadiusValue
        correctAnswerImageView.clipsToBounds = true
        correctAnswerImageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        answerView.addSubview(correctAnswerImageView)

        introductionTextView.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        introductionTextView.text = ""
        introductionTextView.font = UIFont.systemFont(ofSize: 18)
        introductionTextView.delegate = self
        introductionTextView.textAlignment = .left
    }

    func configureQuestionLogic () {
        if score < 10 {

        } else {

        }
    }

    // MARK: - alertController
    func showCorrectAlertController() {
        let correctAlertController = UIAlertController(title: "Correct!🎉", message: "Congratulations!", preferredStyle: .alert)
        correctAlertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(correctAlertController, animated: true)
    }

    func showWrongAlertController() {
        let wrongController = UIAlertController(title: "Keep Going!🎉", message: "Don't give up!", preferredStyle: .alert)
        wrongController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(wrongController, animated: true)
    }

    // MARK: - didTapButton
    @objc func didTapAnswerButtonOne(_ sender: UIButton) {
        progressValue += 1
        gameRoundTextUpdate ()
        print(progressValue)
      print("didTapAnswerButtonOne")
    }

    @objc func didTapAnswerButtonTwo(_ sender: UIButton) {
        progressValue += 1
        gameRoundTextUpdate ()
        print(progressValue)
     print("didTapAnswerButtonTwo")
    }

    @objc func didTapAnswerButtonThree(_ sender: UIButton) {
        progressValue += 1
        gameRoundTextUpdate ()
        print(progressValue)
        print("didTapAnswerButtonThree")
    }

    @objc func didTapAnswerButtonFour(_ sender: UIButton) {
        progressValue += 1
        gameRoundTextUpdate ()
        print(progressValue)
        print("didTapAnswerButtonFour")
    }


    @objc func didTapForwardButton () {
        index += 1
//        showAnswerView()
        print("didTapForwardButton")
    }

    @objc func didTapBackwardButton () {
        index -= 1
        print("didTapbackwardButton")
    }






}
