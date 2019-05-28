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
        if didChange == confirmPassTxt {
            passwordImage.isHidden = false
            confirmPassImage.isHidden = false
        } else {
                passwordImage.isHidden = true
                confirmPassImage.isHidden = true
                confirmPassTxt.text = ""
        }
        if passwordTxt.text == confirmPassTxt.text {
            passwordImage.image = UIImage(named: AppImage.Green)
            confirmPassImage.image = UIImage(named: AppImage.Green)
        } else {
            passwordImage.image = UIImage(named: AppImage.Red)
            confirmPassImage.image = UIImage(named: AppImage.Red)
        }
    }
   
    @IBAction func registerAction(_ sender: Any) {
        guard let email = emailTxt.text , !email.isEmpty ,
            let username = userNameTxt.text, !username.isEmpty,
            let password = passwordTxt.text, !password.isEmpty else { return }
        
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
