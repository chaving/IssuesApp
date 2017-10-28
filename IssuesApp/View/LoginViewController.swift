//
//  LoginViewController.swift
//  IssuesApp
//
//  Created by chaving on 2017. 10. 28..
//  Copyright © 2017년 chaving. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gitHubLoginButton(_ sender: Any) {
        App.api.getToken {
            
        }
    }
}
