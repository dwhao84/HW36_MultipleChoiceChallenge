//
//  HomePageViewController.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import UIKit

class HomePageViewController: UIViewController {

    let anwserBtnOne    = UIButton()
    let anwserBtnTwo    = UIButton()
    let anwserBtnThree  = UIButton()
    let anwserBtnFour   = UIButton()

    let questionImageView = UIImageView()

    let questionTitleLabel       = UILabel() // Ex: How many sexy girl in Taiwan?
    let questionStatusTitleLabel = UILabel() // Which question are we on. Ex: question number 10.

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()

        view.backgroundColor = UIColor.red
    }
    
    func updateUI () {

        // anwserBtnOne
        anwserBtnOne.layer.cornerRadius = 100
        anwserBtnOne.tintColor = UIColor.systemGreen
        anwserBtnOne.configuration?.buttonSize = .large
        anwserBtnOne.setTitle("", for: .normal)
        anwserBtnOne.isUserInteractionEnabled = true

        // anwserBtnOne
    }

    func randomShowQuestion () {
        let randomNumber = Int.random(in: 0...3)

    }

}
