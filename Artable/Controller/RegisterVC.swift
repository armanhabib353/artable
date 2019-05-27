//
//  RegisterVC.swift
//  Artable
//
//  Created by Arman Habib on 26/5/19.
//  Copyright © 2019 Arman Habib. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var activityIndicatorForRegister: UIActivityIndicatorView!
    @IBOutlet weak var passwordImage: UIImageView!
    @IBOutlet weak var confirmPassImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTxt.addTarget(self, action: #selector(textFiledDIdChange(didChange:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFiledDIdChange(didChange:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFiledDIdChange(didChange: UITextField) {
        guard let passTxt = passwordTxt.text else { return }
        if didChange == confirmPassTxt {
            passwordImage.isHidden = false
            confirmPassImage.isHidden = false
        } else {
            if passTxt.isEmpty {
                passwordImage.isHidden = true
                confirmPassImage.isHidden = true
                confirmPassTxt.text = ""
            }
        }
        
        if passwordTxt.text == confirmPassTxt.text {
            passwordImage.image = UIImage(named: "green_check")
            confirmPassImage.image = UIImage(named: "green_check")
        } else {
            passwordImage.image = UIImage(named: "red_check")
            confirmPassImage.image = UIImage(named: "red_check")
        }
        
    }
   
    @IBAction func registerAction(_ sender: Any) {
        guard let email = emailTxt.text , email.isNotEmpty ,
            let username = userNameTxt.text, username.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else { return }
        
        activityIndicatorForRegister.startAnimating()
        
       Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        if let erri = error {
            debugPrint(erri)
            return
        }
        print("Successfull")
        self.activityIndicatorForRegister.stopAnimating()
        }
    }
    
}
