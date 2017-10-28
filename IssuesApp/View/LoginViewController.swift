//
//  LoginViewController.swift
//  IssuesApp
//
//  Created by chaving on 2017. 10. 28..
//  Copyright © 2017년 chaving. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {

    let oauth: OAuth2Swift = OAuth2Swift(
        consumerKey: "ba0d2abf6411cef09c0d",
        consumerSecret: "e02bcf77250763d496c5f9647eb5b98ade5c3873",
        authorizeUrl: "https://github.com/login/oauth/authorize",
        accessTokenUrl: "https://github.com/login/oauth/access_token",
        responseType: "code"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gitHubLoginButton(_ sender: Any) {
        
        oauth.authorize(
            withCallbackURL: "issuesapp://oauth-callback/github",
            scope: "user,repo",
            state: "state",
            success: { (credential, _, _) in
                let token =  credential.oauthToken
                print("token: \(token)")
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
}
