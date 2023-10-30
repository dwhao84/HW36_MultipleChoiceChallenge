//
//  MultipleChoiceViewController.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import UIKit
import CodableCSV

class MultipleChoiceViewController: UIViewController, UITextViewDelegate {

    let answerButtonOne:  UIButton = UIButton(type: .system)
    let answerButtonTwo:  UIButton = UIButton(type: .system)
    let answerButtonThree:UIButton = UIButton(type: .system)
    let answerButtonFour: UIButton = UIButton(type: .system)

    let backwardButton: UIButton = UIButton(type: .system)
    let forwardButton : UIButton = UIButton(type: .system)

    let questionTitleLabel : UILabel = UILabel() // Ex: How many sexy girl in Taiwan?
    let questionStautsLabel: UILabel = UILabel() // Which question are we on. Ex: question number 10.

    let currentScoreLabel:   UILabel = UILabel()

    let welcomeTitleLabel:   UILabel = UILabel()
    let questionContentLabel:UILabel = UILabel()

    let progressView: UIProgressView = UIProgressView()

    var userNameText: String?

    // Create an variable for initial score calculated for gameRound.
    var score: Int = 0

    var gameRoundNumber: CGFloat = 1

    // Create an instance called questionSet for MultipleChoiceData.
    let questionSet = MultipleChoiceData.data

    var index: Int = 0
    var selectedAnswerContent: String?

//    // Create an answerView content:
//    let answerView: UIView = UIView()
//    let correctAnswerImageView = UIImageView()
//    let introductionTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        gameRoundTextUpdate ()
        print("MulitpleVC")

        print(gameRoundNumber)
        print(questionSet)
    }

    // MARK: - configure UI
    func configureUI () {

        let cornerRadiusValue: CGFloat = 25

        let buttons: [UIButton] = [
            answerButtonOne,
            answerButtonTwo,
            answerButtonThree,
            answerButtonFour
        ]

        self.view.backgroundColor = UIColor.black

        // answerButton series
        answerButtonOne.frame   = CGRect(x: 51, y: 475, width: 325, height: 50)
        answerButtonOne.addTarget(self, action: #selector(didTapAnswerButtonOne), for: .touchUpInside)

        answerButtonTwo.frame   = CGRect(x: 51, y: 538, width: 325, height: 50)
        answerButtonTwo.addTarget(self, action: #selector(didTapAnswerButtonTwo), for: .touchUpInside)

        answerButtonThree.frame = CGRect(x: 51, y: 603, width: 325, height: 50)
        answerButtonThree.addTarget(self, action: #selector(didTapAnswerButtonThree), for: .touchUpInside)

        answerButtonFour.frame  = CGRect(x: 51, y: 667, width: 325, height: 50)
        answerButtonFour.addTarget(self, action: #selector(didTapAnswerButtonFour), for: .touchUpInside)

        for button in buttons {
            button.tintColor = UIColor.lightGray
            button.backgroundColor = UIColor.black
            button.isHidden = false
            button.layer.cornerRadius = cornerRadiusValue
            button.clipsToBounds = true
            button.layer.borderWidth = 0.6
            button.layer.borderColor = UIColor.systemBlue.cgColor
            view.addSubview(button)

//            button.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//
//            ])
        }

        // forwardButton 往前 ->
        let configuration = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        let forwardImageSymbol = UIImage(systemName: "arrow.forward.circle", withConfiguration: configuration)
        forwardButton.setImage(forwardImageSymbol, for: .normal)
        forwardButton.frame = CGRect(x: 317, y: 818, width: 60, height: 60)
        forwardButton.setTitleColor(UIColor.white, for: .normal)
        forwardButton.tintColor = UIColor.systemBlue
        forwardButton.isHidden = false
        forwardButton.addTarget(self, action: #selector(didTapForwardButton), for: .touchUpInside)
        view.addSubview(forwardButton)

        // backwardButton 往後 <-
        let backwardConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold)
        let backwardImageSymbol = UIImage(systemName: "arrow.left", withConfiguration: backwardConfiguration)
        backwardButton.setImage(backwardImageSymbol, for: .normal)
        backwardButton.frame = CGRect(x: 41, y: 826, width: 45, height: 45)
        backwardButton.setTitleColor(UIColor.white, for: .normal)
        backwardButton.tintColor = UIColor.systemBlue
        backwardButton.isHidden = false
        backwardButton.addTarget(self, action: #selector(didTapBackwardButton), for: .touchUpInside)
        view.addSubview(backwardButton)

        // welcomeTitleLabel
        welcomeTitleLabel.frame = CGRect(x: 51, y: 68, width: 326, height: 80)
        welcomeTitleLabel.text = "Welcome \(userNameText ?? ""),"
        welcomeTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        welcomeTitleLabel.textColor = UIColor.white
        welcomeTitleLabel.textAlignment = .left
        welcomeTitleLabel.numberOfLines = 1
        welcomeTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(welcomeTitleLabel)

        // questionTitleLabel
        questionTitleLabel.frame = CGRect(x: 51, y: 150, width: 325, height: 270)
        questionTitleLabel.font = UIFont.systemFont(ofSize: 20)
        questionTitleLabel.textColor = UIColor.white
        questionTitleLabel.textAlignment = .left
        questionTitleLabel.numberOfLines = 4
        questionTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionTitleLabel)

        // questionContentLabel
        questionContentLabel.frame = CGRect(x: 51, y: 130, width: 124, height: 30)
        questionContentLabel.text = "Question \(Int(gameRoundNumber))"
        questionContentLabel.font = UIFont.systemFont(ofSize: 25)
        questionContentLabel.textColor = UIColor.white
        questionContentLabel.textAlignment = .left
        questionContentLabel.numberOfLines = 1
        questionContentLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionContentLabel)

        // questionStautsLabel
        questionStautsLabel.frame = CGRect(x: 51, y: 754, width: 135, height: 20)
        questionStautsLabel.text = "Question \(Int(gameRoundNumber * 10)) / 10"
        questionStautsLabel.font = UIFont.systemFont(ofSize: 19)
        questionStautsLabel.textColor = UIColor.lightGray
        questionStautsLabel.textAlignment = .left
        questionStautsLabel.numberOfLines = 1
        questionStautsLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(questionStautsLabel)

        // currentScoreLabel
        currentScoreLabel.frame = CGRect(x: 51, y: 168, width: 96, height: 20)
        currentScoreLabel.text = "Score: \(score) points"
        currentScoreLabel.font = UIFont.systemFont(ofSize: 16)
        currentScoreLabel.textColor = UIColor.lightGray
        currentScoreLabel.textAlignment = .left
        currentScoreLabel.numberOfLines = 1
        currentScoreLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(currentScoreLabel)

        // progressView
        progressView.frame  = CGRect(x: 51, y: 795, width: 325, height: 5)
        progressView.progress = Float(gameRoundNumber / 10)
        progressView.tintColor = UIColor.systemBlue
        view.addSubview(progressView)

        displayRandomQuestion()
    }

//    // showAnswerView
//    func showAnswerView () {
//        let cornerRadiusValue: CGFloat = 10.0
//        let imageViewCornerRadiusValue: CGFloat = 1
//        answerView.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
//        answerView.layer.cornerRadius = cornerRadiusValue
//        answerView.clipsToBounds = true
//        view.addSubview(answerView)
//
//        print("Into the answerView")
//
//        // answerView Auto-Layout
//        answerView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            answerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            answerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            answerView.widthAnchor.constraint(equalToConstant: 300),
//            answerView.heightAnchor.constraint(equalToConstant: 600)
//        ])
//
//        // correctAnswerImageView
//        correctAnswerImageView.image = UIImage(named: "")
//        correctAnswerImageView.layer.cornerRadius = imageViewCornerRadiusValue
//        correctAnswerImageView.clipsToBounds = true
//        correctAnswerImageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        answerView.addSubview(correctAnswerImageView)
//
//        // introductionTextView
//        introductionTextView.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
//        introductionTextView.text = ""
//        introductionTextView.font = UIFont.systemFont(ofSize: 18)
//        introductionTextView.delegate = self
//        introductionTextView.textAlignment = .left
//    }

    func showFinalScoreVC () {
        let finalScoreViewController = FinalScoreViewController()
        present(finalScoreViewController, animated: true)
    }

    func gameRoundTextUpdate () {
        progressView.setProgress(Float((gameRoundNumber ) / 10), animated: true)
        questionStautsLabel.text = "Question \(Int(gameRoundNumber)) / 10"
        questionContentLabel.text = "Question \(Int(gameRoundNumber))"
    }

    private func buttonsIsNotEnable () {

        let buttons: [UIButton] = [
            answerButtonOne,
            answerButtonTwo,
            answerButtonThree,
            answerButtonFour
        ]

        for button in buttons {
            button.isEnabled = false
        }
    }

    private func buttonsIsEnable () {

        let buttons: [UIButton] = [
            answerButtonOne,
            answerButtonTwo,
            answerButtonThree,
            answerButtonFour
        ]

        for button in buttons {
            button.isEnabled = true
        }
    }

    private func displayRandomQuestion () {
        index = Int.random(in: 0...questionSet.count - 1)

        var randomAnswerArray: [String?] = [
                questionSet[index].answerOne, 
                questionSet[index].answerTwo,
                questionSet[index].answerThree,
                questionSet[index].answerFour
        ]

        randomAnswerArray.shuffle()

        questionTitleLabel.text = questionSet[index].question
        answerButtonOne.setTitle(randomAnswerArray  [0], for: .normal)
        answerButtonTwo.setTitle(randomAnswerArray  [1], for: .normal)
        answerButtonThree.setTitle(randomAnswerArray[2], for: .normal)
        answerButtonFour.setTitle(randomAnswerArray [3], for: .normal)

        print("This is the index of displayRandomQestion is: \(index)")
        buttonsIsEnable()
    }

    func presentToFinalScoreVC () {
        let finalScoreVC = FinalScoreViewController()
        finalScoreVC.scoreValue = score
        present(finalScoreVC, animated: true)
    }

    // MARK: - Create AlertController
    func showCorrectAlertController() {
        let correctAlertController = UIAlertController(
            title: "Correct!🎉",
            message: "Congratulations!",
            preferredStyle: .alert
        )
        correctAlertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(correctAlertController, animated: true)
    }

    func showWrongAlertController() {
        let wrongController = UIAlertController(
            title: "Keep Going!🎉",
            message: "Don't give up!",
            preferredStyle: .alert
        )
        wrongController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(wrongController, animated: true)
    }

    // MARK: - didTapButton
    // answerButton #1
    @objc func didTapAnswerButtonOne(_ sender: UIButton) {

        let correctAnswer = questionSet[index].correctAnswer
        selectedAnswerContent = sender.title(for: .normal)

        print("didTapAnswerButtonOne")
        print("This is the index: \(index)")
        print("This is the correctAnswer: \(correctAnswer!)")
        print("This is the selectedAnswer: \(selectedAnswerContent!)")

        if selectedAnswerContent == correctAnswer {
            showCorrectAlertController()
            score += 10
            currentScoreLabel.text = "Score: \(score) points"
            print("Correct answer!")
        } else {
            showWrongAlertController()
            print("Wrong answer!")
        }
        buttonsIsNotEnable()
        print("This is the currentScore: \(score)")
    }

    // answerButton #2
    @objc func didTapAnswerButtonTwo(_ sender: UIButton) {

        selectedAnswerContent = sender.title(for: .normal)
        let correctAnswer = questionSet[index].correctAnswer

        print("This is the index: \(index)")
        print("didTapAnswerButtonTwo")
        print("This is the correctAnswer: \(correctAnswer!)")
        print("This is the selectedAnswer: \(selectedAnswerContent!)")

        if selectedAnswerContent == correctAnswer {
            showCorrectAlertController()
            score += 10
            currentScoreLabel.text = "Score: \(score) points"
            print("Correct answer!")
        } else {
            showWrongAlertController()
            print("Wrong answer!")
        }
        buttonsIsNotEnable()
        print("This is the currentScore: \(score)")
    }

    // answerButton #3
    @objc func didTapAnswerButtonThree(_ sender: UIButton) {

        let correctAnswer = questionSet[index].correctAnswer
        selectedAnswerContent = sender.title(for: .normal)

        print("This is the index: \(index)")
        print("didTapAnswerButtonThree")
        print("This is the correctAnswer: \(correctAnswer!)")
        print("This is the selectedAnswer: \(selectedAnswerContent!)")

        if selectedAnswerContent == correctAnswer {
            showCorrectAlertController()
            score += 10
            currentScoreLabel.text = "Score: \(score) points"
            print("Correct answer!")
        } else {
            showWrongAlertController()
            print("Wrong answer!")
        }
        buttonsIsNotEnable()
        print("This is the currentScore: \(score)")
    }

    // answerButton #4
    @objc func didTapAnswerButtonFour(_ sender: UIButton) {

        let correctAnswer = questionSet[index].correctAnswer
        selectedAnswerContent = sender.title(for: .normal)

        print("This is the index: \(index)")
        print("didTapAnswerButtonFour")
        print("This is the correctAnswer: \(correctAnswer!)")
        print("This is the selectedAnswer: \(selectedAnswerContent!)")

        if selectedAnswerContent == correctAnswer {
            showCorrectAlertController()
            score += 10
            currentScoreLabel.text = "Score: \(score) points"
            print("Correct answer!")
        } else {
            showWrongAlertController()
            print("Wrong answer!")
        }
        buttonsIsNotEnable()
        print("This is the currentScore: \(score)")
    }

    // forwardButton
    @objc func didTapForwardButton () {
        if gameRoundNumber < 10.0 {
            displayRandomQuestion ()
            gameRoundNumber += 1
            gameRoundTextUpdate ()
            print("The game round is \(gameRoundNumber)")
            buttonsIsEnable()
        } else {
            gameRoundNumber += 0
            print("Game Over")
            presentToFinalScoreVC ()
        }
    }

    // backwardButton
    @objc func didTapBackwardButton () {
        if gameRoundNumber < 10.0 {
            displayRandomQuestion ()
            gameRoundNumber += 1
            gameRoundTextUpdate ()
            print("The game round is \(gameRoundNumber)")
            buttonsIsEnable()
        } else {
            gameRoundNumber += 0
            print("Game Over")
            presentToFinalScoreVC ()
        }
    }
}

