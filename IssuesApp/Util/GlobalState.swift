//
//  GlobalState.swift
//  IssuesApp
//
//  Created by chaving on 2017. 10. 28..
//  Copyright © 2017년 chaving. All rights reserved.
//

import Foundation

// 싱글턴
final class GlobalState {
    static let instance = GlobalState() // 싱글턴 선언
    
    enum Constants: String {
        case tokenKey
        case refreshTokenKey
    }
    
    var token: String? {
        get {
            let token = UserDefaults.standard.string(forKey: Constants.tokenKey.rawValue)
            return token
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.tokenKey.rawValue)
        }
    }
    
    var refreshToken: String? {
        get {
            let token = UserDefaults.standard.string(forKey: Constants.refreshTokenKey.rawValue)
            return token
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.refreshTokenKey.rawValue)
        }
    }
}















