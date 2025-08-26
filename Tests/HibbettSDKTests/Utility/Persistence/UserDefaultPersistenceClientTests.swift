//
//  UserDefaultPersistenceClientTests.swift
//  Hibbett
//
//  Created by Thibault Klein on 6/13/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import HibbettSDK

final class UserDefaultPersistenceClientTests: XCTestCase {

    var userDefaultPersistenceClient: UserDefaultsPersistenceClient!
    let object = "UserPersistenceClientTestObject"
    let key = "UserPersistenceClientTestObjectKey"

    override func setUp() {
        super.setUp()

        userDefaultPersistenceClient = UserDefaultsPersistenceClient()
    }

    override func tearDown() {
        userDefaultPersistenceClient.removeObject(forKey: key)
        userDefaultPersistenceClient = nil

        super.tearDown()
    }

    func getObjectInUserDefaultPersistenceClient_whenObjectDoesntExist() {
        // Given
        let resultObject = userDefaultPersistenceClient.object(forKey: "random key") as? String

        // Then
        XCTAssertNil(resultObject)
    }

    func setObjectInUserDefaultPersistenceClient() {
        // Given
        userDefaultPersistenceClient.set(object, forKey: key)

        // When
        let expectedObject = object

        // Then
        let resultObject = userDefaultPersistenceClient.object(forKey: key) as? String
        XCTAssertEqual(expectedObject, resultObject)
    }

    func removeObjectInUserDefaultPersistenceClient() {
        // Given
        userDefaultPersistenceClient.set(object, forKey: key)
        userDefaultPersistenceClient.removeObject(forKey: key)

        // Then
        let resultObject = userDefaultPersistenceClient.object(forKey: key) as? String
        XCTAssertNil(resultObject)
    }

}
