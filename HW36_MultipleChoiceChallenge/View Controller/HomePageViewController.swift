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
    let arrowButton = UIButton()

    var nameText: String?



    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }


    @objc func showKeyboard () {
        enterNameTextField.becomeFirstResponder()
    }

    @objc func arrowButtonTapped () {
        let multipleChoiceVC = MultipleChoiceViewController ()

        present(multipleChoiceVC, animated: true)
        print("arrowButtonTapped")
    }
    
    func updateUI () {

        self.view.backgroundColor = UIColor.black

        // Set up titleLabel for Home Page.
        titleLabel.frame = CGRect(x: 54, y: 423, width: 320, height: 80)
        titleLabel.font = UIFont.systemFont(ofSize: 28)
        titleLabel.textColor = UIColor.white
        titleLabel.text = "Welcome to Apple Multiple Choice "
        titleLabel.numberOfLines = 2
        view.addSubview(titleLabel)

        // Show imageView for WWDC gif
        let animatedImage = UIImage.animatedImageNamed("WWDC23_Apple_", duration: 4)
        appleImageView.frame = CGRect(x: 54, y: 68, width: 320, height: 320)
        appleImageView.image = animatedImage
        appleImageView.contentMode = .scaleToFill
        view.addSubview(appleImageView)

        enterNameTextField.frame = CGRect(x: 54, y: 530, width: 320, height: 50)
        enterNameTextField.placeholder = "Enter your name"
        enterNameTextField.borderStyle = .roundedRect
        enterNameTextField.textColor = UIColor.lightGray
        enterNameTextField.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        enterNameTextField.layer.cornerRadius = 10
        enterNameTextField.clipsToBounds = true
        enterNameTextField.becomeFirstResponder()
        view.addSubview(enterNameTextField)

        arrowButton.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        

    }


}

extension HomePageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return true
    }



}
