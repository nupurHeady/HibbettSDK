//
//  UserDefaultsPersistenceClient.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation
import PCFSwift

/// Persistence client utilizing UserDefaults.
public struct UserDefaultsPersistenceClient: Persistable {

    // MARK: - Properties

    /// User defaults to store to.
    public let userDefaults: UserDefaults

    // MARK: - Init

    public init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    public init() {
        self.init(userDefaults: UserDefaults.standard)
    }

    public func object(forKey key: String) -> Any? {
        if let data = userDefaults.object(forKey: key) as? Data {
            return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
        } else {
            return nil
        }
    }

    public func set(_ object: Any?, forKey defaultName: String) {
        if let object = object {
            let data: Data?
            if #available(iOS 11.0, *) {
                data = try? NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            } else {
                data = NSKeyedArchiver.archivedData(withRootObject: object)
            }
            userDefaults.set(data, forKey: defaultName)
            userDefaults.synchronize()
        }
    }

    public func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }

}
