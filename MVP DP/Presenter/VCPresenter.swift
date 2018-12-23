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
    
    private var userName:String!
    private var password:String!
    var delegate:VCDelegate?
    
    public func initWith(userName:String, password:String) {
        self.userName = userName
        self.password = password
    }
    
    private func validateData() throws {
        if userName.isEmpty {
            throw LoginError.userNameIsEmpty
        } else if password.isEmpty {
            throw LoginError.passwordIsEmpty
        }
    }
    
    public func login() {
        do {
            try validateData()
        } catch LoginError.userNameIsEmpty {
            delegate?.showMessage(message: "Username is empty")
        } catch LoginError.passwordIsEmpty {
            delegate?.showMessage(message: "Pasword is empty")
        } catch {
            print("\(error)")
        }
        verifyUser()
    }
    
    private func verifyUser() {
        if self.userName == "test" && self.password == "12345678" {
            // fill the object from api
            _ = User.init(name: "test", gender: .male, email: "test@example.com")
            self.delegate?.userSuccessfullyLoggedIn()
        } else {
            self.delegate?.showMessage(message: "Username or password is invalid")
        }
    }
}
