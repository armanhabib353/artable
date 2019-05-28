//
//  ViewController.swift
//  Artable
//
//  Created by Arman Habib on 25/5/19.
//  Copyright © 2019 Arman Habib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: LoginStoryBoard.Storyboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: LoginStoryboardID.LoginId)
        present(controller, animated: true, completion: nil)
    }

}

