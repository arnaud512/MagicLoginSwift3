//
//  UserDefaults+Helpers.swift
//  MagicLogin
//
//  Created by Arnaud Dupuy on 28/10/2016.
//  Copyright © 2016 Arnaud Dupuy. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(_ value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

}
