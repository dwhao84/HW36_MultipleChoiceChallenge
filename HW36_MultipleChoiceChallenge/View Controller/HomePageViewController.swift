//
//  HomePageViewController.swift
//  HW36_MultipleChoiceChallenge
//
//  Created by Dawei Hao on 2023/10/19.
//

import UIKit
import AVFoundation
import AVKit

class HomePageViewController: UIViewController {

    let appleImageView = UIImageView()
    let titleLabel = UILabel()
    let enterNameTextField = UITextField()
    let arrowButton = UIButton(type: .system)

    let stackView = UIStackView()

    var nameText: String?



    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }


    func showKeyboard () {
        enterNameTextField.becomeFirstResponder()
    }

    @objc func arrowButtonTapped () {
        let multipleChoiceVC = MultipleChoiceViewController ()

        present(multipleChoiceVC, animated: true)
        print("arrowButtonTapped")

    }
    
    func updateUI () {

        self.view.backgroundColor = UIColor.black

        // titleLabel
        titleLabel.frame = CGRect(x: 54, y: 423, width: 320, height: 80)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = UIColor.white
        titleLabel.text = "Welcome to Apple Multiple Choice "
        titleLabel.numberOfLines = 2
        view.addSubview(titleLabel)

        // appleImageView
        let animatedImage = UIImage.animatedImageNamed("WWDC23_Apple_", duration: 4)
        appleImageView.frame = CGRect(x: 54, y: 68, width: 320, height: 320)
        appleImageView.image = animatedImage
        appleImageView.contentMode = .scaleToFill
        view.addSubview(appleImageView)

        // enterNameTextField
        enterNameTextField.frame = CGRect(x: 54, y: 530, width: 320, height: 50)
        let placeholderText = "Enter your name"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        enterNameTextField.attributedPlaceholder = attributedPlaceholder
        enterNameTextField.borderStyle = .roundedRect
        enterNameTextField.textColor = UIColor.lightGray
        enterNameTextField.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        enterNameTextField.layer.cornerRadius = 10
        enterNameTextField.clipsToBounds = true
        enterNameTextField.becomeFirstResponder()
        view.addSubview(enterNameTextField)

        showKeyboard()

        // arrowButton
        let configuration = UIImage.SymbolConfiguration(pointSize: 45, weight: .bold)
        let symbolImage = UIImage(systemName: "arrow.right.circle.fill", withConfiguration: configuration)
        arrowButton.setImage(symbolImage, for: .normal)
        arrowButton.frame = CGRect(x: 300, y: 751, width: 95, height: 95)
        arrowButton.setTitleColor(UIColor.white, for: .normal)
        arrowButton.tintColor = UIColor.systemGreen
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        view.addSubview(arrowButton)
    }

    func setStackViewConstriant () {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
//        stackView.arrangedSubviews = []
    }

    func configureLayoutConstraint () {

    }


}

extension HomePageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return true
    }



}
