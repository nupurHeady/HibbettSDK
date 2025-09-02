//
//  HTTPRequest+FactoryFunctions.swift
//  Hibbett
//
//  Created by Harlan Kellaway on 6/9/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit
import PCFSwift
import CoreFeature

/// Factory functions for creating new HTTPRequest instances from existing HTTPRequests.
public extension HTTPRequest {
    /// Adds API key to HTTP request given an Environment.
    ///
    /// - Parameter environment: Environment determining API key.
    /// - Returns: HTTP Request.
    func withAPIKey(_ environment: Environment) -> HTTPRequest {
        let apiKey = environment.apiKey()
        let apiKeyHeader = ["x-api-key": apiKey]
        return self.withAdditionalHeaders(apiKeyHeader)
    }

    /// Adds app version heaer to HTTP request.
    ///
    /// - Returns: HTTP request.
    @MainActor func withDeviceInfo() -> HTTPRequest {
        let deviceInfoHeaders = ["version": UIApplication.shared.appVersion(),
                                 "platform": "ios"]
        return self.withAdditionalHeaders(deviceInfoHeaders)
    }

    /// Creates a new HTTP Request from the current one, replacing queryItems with the new ones provided.
    ///
    /// - Parameter newQueryItems: New queryItems.
    /// - Returns: New HTTP Request with new queryItems.
    func withNewQueryItems(_ newQueryItems: QueryItems) -> HTTPRequest {
        return HTTPRequest(method: method,
                           baseURL: baseURL,
                           path: path,
                           queryItems: newQueryItems,
                           parameters: parameters,
                           headers: headers)
    }

    /// Creates a new HTTP Request from the current one, replacing headers with the new ones provided.
    ///
    /// - Parameter newHeaders: New headers.
    /// - Returns: New HTTP Request with new headers.
    func withAdditionalHeaders(_ newHeaders: Headers) -> HTTPRequest {
        /* ShopSimilar removal:
         // A check to prevent additional headers being added to Syte apis.
         guard baseURL.absoluteString != BusinessConstants.URLConstants.baseSyteURL else { return self } */

        let originalHeaders = (headers == nil) ? [:] : headers!
        let finalHeaders = originalHeaders.combineWith(newHeaders)

        return HTTPRequest(method: method,
                           baseURL: baseURL,
                           path: path,
                           queryItems: queryItems,
                           parameters: parameters,
                           headers: finalHeaders)
    }

    func withAuthHeaders(_ persist: Persistable?) -> HTTPRequest {
        let siteVibesURLDev = BusinessConstants.URLConstants.baseSiteVibesURLDev
        let siteVibesURLProduction = BusinessConstants.URLConstants.baseSiteVibesURLProduction

        // A check to prevent SiteVibes apis' token overwritten by oauth session token.
        guard baseURL.absoluteString != siteVibesURLDev else { return self }
        guard baseURL.absoluteString != siteVibesURLProduction else { return self }

        let narvarURLDev = BusinessConstants.URLConstants.baseNarvarTrackingURLDev
        let narvarURLProduction = BusinessConstants.URLConstants.baseNarvarTrackingURLProduction

        // A check to prevent Narvar order tracking apis' token overwritten by oauth session token.
        guard baseURL.absoluteString != narvarURLDev else { return self }
        guard baseURL.absoluteString != narvarURLProduction else { return self }

        /* ShopSimilar removal:
         let syteURL = BusinessConstants.URLConstants.baseSyteURL

         // A check to prevent auth headers being added to Syte apis.
         guard baseURL.absoluteString != syteURL else { return self } */

        var originalHeaders = (headers == nil) ? [:] : headers!

        if let session = persist?.object(forKey: "oauthSessionKey") as? OAuthSession {
            originalHeaders["Authorization"] = "Bearer \(session.token)"
        }

        return HTTPRequest(method: method,
                           baseURL: baseURL,
                           path: path,
                           queryItems: queryItems,
                           parameters: parameters,
                           headers: originalHeaders)
    }
}
