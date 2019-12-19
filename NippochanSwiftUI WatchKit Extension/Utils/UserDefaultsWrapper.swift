//
//  UserDefaultsWrapper.swift
//  NippochanSwiftUI WatchKit Extension
//
//  Created by Takuya Aso on 2019/08/13.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
