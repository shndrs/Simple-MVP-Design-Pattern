//
//  VCPresenter.swift
//  MVP DP
//
//  Created by Sahand Raeisi on 12/23/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import Foundation

public protocol VCDelegate {
    func showMessage(message:String)
    func userSuccessfullyLoggedIn()
}

fileprivate enum LoginError:Error {
    case userNameIsEmpty
    case passwordIsEmpty
}

class VCPresenter: NSObject {
    
    private var loginInfo:(userName:String,password:String)!
    var delegate:VCDelegate?
    
    public func initWith(loginInfo:(userName:String, password:String)) {
        self.loginInfo = loginInfo
    }
    
    private func validateData() throws {
        if loginInfo.userName.isEmpty {
            throw LoginError.userNameIsEmpty
        } else if loginInfo.password.isEmpty {
            throw LoginError.passwordIsEmpty
        }
    }
    
    public func login() {
        do {
            try validateData()
        } catch LoginError.userNameIsEmpty {
            delegate?.showMessage(message: "Username is empty")
            return
        } catch LoginError.passwordIsEmpty {
            delegate?.showMessage(message: "Password is empty")
            return
        } catch {
            print("\(error)")
            return
        }
        verifyUser()
    }
    
    private func verifyUser() {
        if self.loginInfo.userName == "test" && self.loginInfo.password == "12345678" {
            // fill the object from api
            _ = User.init(name: "test", gender: .male, email: "test@example.com")
            self.delegate?.userSuccessfullyLoggedIn()
        } else {
            self.delegate?.showMessage(message: "Username or password is invalid")
        }
    }
}
