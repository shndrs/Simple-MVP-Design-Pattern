//
//  UserModel.swift
//  MVP DP
//
//  Created by Sahand Raeisi on 12/23/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import Foundation

public enum Gender:String {
    case male
    case female
    case other
}

public struct User {
    private(set) var name:String
    private(set) var gender:Gender
    private(set) var email:String
}
