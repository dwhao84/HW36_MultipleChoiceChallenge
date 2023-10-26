//
//  FinalScoreViewController.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/23.
//

import UIKit

class FinalScoreViewController: UIViewController {

    let yourScoreTitleLabel = UILabel()
    let resultScoreLabel = UILabel()

    var scoreValue: Int = 0

    let playAgainButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    func configureUI () {

        view.backgroundColor = .black

        let cornerRadiusValue: CGFloat = 25.0

        yourScoreTitleLabel.text = "Your score"
        yourScoreTitleLabel.frame = CGRect(x: 51, y: 52, width: 326, height: 80)
        yourScoreTitleLabel.font = UIFont.systemFont(ofSize: 30)
        yourScoreTitleLabel.textColor = UIColor.white
        yourScoreTitleLabel.textAlignment = .left
        yourScoreTitleLabel.numberOfLines = 1
        yourScoreTitleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(yourScoreTitleLabel)

        resultScoreLabel.text = "Your Final Score is \(scoreValue)"
        resultScoreLabel.frame = CGRect(x: 51, y: 225, width: 325, height: 160)
        resultScoreLabel.font = UIFont.systemFont(ofSize: 40)
        resultScoreLabel.textColor = UIColor.white
        resultScoreLabel.textAlignment = .center
        resultScoreLabel.numberOfLines = 1
        resultScoreLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(resultScoreLabel)

        playAgainButton.setTitle("Play Again", for: .normal)
        playAgainButton.tintColor = .systemBlue
        playAgainButton.frame   = CGRect(x: 139, y: 475, width: 150, height: 50)
        playAgainButton.backgroundColor = UIColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 1)
        playAgainButton.isHidden = false
        playAgainButton.layer.cornerRadius = cornerRadiusValue
        playAgainButton.clipsToBounds = true
        playAgainButton.layer.borderWidth = 0.5
        playAgainButton.layer.borderColor = UIColor.systemBlue.cgColor
        playAgainButton.addTarget(self, action: #selector(didTapPlayAgainButton), for: .touchUpInside)
        view.addSubview(playAgainButton)
    }

    // After click the playAgainButton, it'll back to the MultipleChoiceViewController.
    @objc func didTapPlayAgainButton () {
        let multipleChoiceViewController = MultipleChoiceViewController()
        multipleChoiceViewController.modalPresentationStyle = .fullScreen
        present(multipleChoiceViewController, animated: true)
        print("didTapPlayAgainButton")
    }




    
}
