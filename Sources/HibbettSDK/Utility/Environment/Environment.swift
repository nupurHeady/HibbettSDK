//
//  Environment.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/9/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation
import Keys
import PCFSwift

/// Environment.
///
/// - dev: Dev.
/// - staging: Staging.
/// - production: Production.
/// - feature: Feature.
/// - mock: Mock.
public enum Environment: String {
    case dev = "Dev"
    case staging = "Staging"
    case production = "Production"
    case feature = "Feature"
    case mock = "Mock"

    /// All environments.
    ///
    /// - Returns: All environments.
    public static func allEnvironments() -> [Environment] {
        return [.mock, .feature, .dev, .staging, .production]
    }

    /// API key for the environment.
    ///
    /// - Returns: API key.
    public func apiKey() -> String {
        switch self {
        case .dev:
            return HibbettKeys().hibbettDevAPIKey
        case .staging:
            return HibbettKeys().hibbettStagingAPIKey
        case .production:
            return HibbettKeys().hibbettProdAPIKey
        case .feature:
            return HibbettKeys().hibbettFeatureEnvAPIKey
        case .mock:
            return HibbettKeys().hibbettMockEnvAPIKey
        }
    }

    /// Base URL for the environment.
    ///
    /// - Returns: Base URL.
    public func baseURL() -> URL {
        switch self {
        case .dev:
            return URL(string: BusinessConstants.URLConstants.baseURLDev)!
        case .staging:
            return URL(string: BusinessConstants.URLConstants.baseURLStaging)!
        case .production:
            return URL(string: BusinessConstants.URLConstants.baseURLProduction)!
        case .feature:
            return URL(string: BusinessConstants.URLConstants.baseURLFeature)!
        case .mock:
            return URL(string: BusinessConstants.URLConstants.baseURLMock)!
        }
    }

}
