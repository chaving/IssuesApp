//
//  API.swift
//  IssuesApp
//
//  Created by chaving on 2017. 10. 28..
//  Copyright © 2017년 chaving. All rights reserved.
//

import Foundation
import OAuthSwift


protocol API {
    func getToken(handler: @escaping (() -> Void))
    func tokenRefresh(handler: @escaping (() -> Void))
}

struct GitHubAPI: API {
    
    let oauth: OAuth2Swift = OAuth2Swift(
        consumerKey: "ba0d2abf6411cef09c0d",
        consumerSecret: "e02bcf77250763d496c5f9647eb5b98ade5c3873",
        authorizeUrl: "https://github.com/login/oauth/authorize",
        accessTokenUrl: "https://github.com/login/oauth/access_token",
        responseType: "code"
    )
    
    func getToken(handler: @escaping (() -> Void)) {
        oauth.authorize(
            withCallbackURL: "issuesapp://oauth-callback/github",
            scope: "user,repo",
            state: "state",
            success: { (credential, _, _) in
                let token =  credential.oauthToken
                let refreshToken = credential.oauthRefreshToken
                print("token: \(token)")
                GlobalState.instance.token = token
                GlobalState.instance.refreshToken = refreshToken
                handler()
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
    
    func tokenRefresh(handler: @escaping (() -> Void)) {
        guard let refreshToken = GlobalState.instance.refreshToken else { return }
        
        oauth.renewAccessToken(withRefreshToken: refreshToken, success: { (credential, _, _) in
            
        }) { error in
            print(error.localizedDescription)
        }
    }
}


















