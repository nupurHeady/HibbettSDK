//
//  OAuthSession.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//
import Foundation
import PCFSwift

/// OAuth session.
public final class OAuthSession: NSObject, NSCoding, Swift.Decodable {
    
    // MARK: - Types

    /// Session state.
    ///
    /// - active: Session has not yet expired.
    /// - expired: Session is expired.
    public enum State {
        case active
        case expired
    }
    
    // MARK: - Class properties
    
    /// Date formatter.
    static let dateFormatter: DateFormatter = HibbettDateFormatter.shared

    // MARK: - Properties

    /// Token.
    public let token: String

    /// Expiration date.
    public let expirationDate: Date
    
    /// User ID
    public let userID: String

    /// State.
    public var state: State {
        return isExpired() ? .expired : .active
    }

    // MARK: - Init

    public init(token: String, expirationDate: Date, userID: String) {
        self.token = token
        self.expirationDate = expirationDate
        self.userID = userID
    }
    
    // MARK: - Protocol conformance
    
    // MARK: Decodable
    
    public enum CodingKeys: String, CodingKey {
        case sessionId
        case expDate
        case customerId
    }
    
    public convenience init(from decoder: Swift.Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let sessionId = try values.decode(String.self, forKey: .sessionId)
        let expDateString = try values.decode(String.self, forKey: .expDate)
        let customerId = try values.decode(String.self, forKey: .customerId)
        
        guard let expDate = OAuthSession.dateFormatter.date(from: expDateString) else {
            let invalidExpDate = DecodingError.Context(codingPath: [CodingKeys.expDate],
                                                       debugDescription: "OAuthSession invalid expDate")
            throw DecodingError.dataCorrupted(invalidExpDate)
        }
        
        self.init(token: sessionId, expirationDate: expDate, userID: customerId)
    }
    
    // MARK: NSCoding

    public required convenience init?(coder decoder: NSCoder) {
        guard
            let token = decoder.decodeObject(forKey: "token") as? String,
            let expirationDate = decoder.decodeObject(forKey: "expirationDate") as? Date,
            let userID = decoder.decodeObject(forKey: "userID") as? String else {
                return nil
        }

        self.init(token: token, expirationDate: expirationDate, userID: userID)
    }

    public func encode(with coder: NSCoder) {
        coder.encode(self.token, forKey: "token")
        coder.encode(self.expirationDate, forKey: "expirationDate")
        coder.encode(self.userID, forKey: "userID")
    }

    // MARK: - Public Functions

    /// Whether the current session is expired - meaning the current
    /// time is greater than its expiration date.
    ///
    /// - Returns: Whether the current session is expired.
    public func isExpired() -> Bool {
        let now = Date()

        return now > expirationDate
    }

}
