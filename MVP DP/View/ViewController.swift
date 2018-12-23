//
//  ViewController.swift
//  MVP DP
//
//  Created by Sahand Raeisi on 12/23/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var userNameTF:UITextField!
    @IBOutlet private weak var passwordTF:UITextField!
    @IBOutlet fileprivate weak var errorLabel:UILabel!
    
    private var presenter = VCPresenter()
    
    private var colorArray:[(colorOne:UIColor, colorTwo:UIColor)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        errorLabel.isHidden = true
    }

    @IBAction private func submitData(_ sender: UIButton) {
        self.presenter.initWith(userName: userNameTF.text!, password: passwordTF.text!)
        self.presenter.login()
    }
}

extension ViewController: VCDelegate {
    func showMessage(message: String) {
        errorLabel.isHidden = false
        errorLabel.textColor = .red
        errorLabel.text = message
    }
    
    func userSuccessfullyLoggedIn() {
        errorLabel.text = "User logged in ;)"
        errorLabel.textColor = .black
        errorLabel.isHidden = false
    }
}
