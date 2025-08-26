//
//  PlatformDataManager.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/16/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Platform data manager. Describes all the managers responsible for handling your customer data.
///
/// This encapsulates data like push notification, analytics, and other marketing purposes data.
public protocol PlatformDataManager {

    /// App analytics manager.
    var analyticsManager: AnalyticsManager { get }

    /// App notification manager.
    var notificationManager: NotificationManager { get }

    /// Starts the platform data management.
    func start()

}

public extension PlatformDataManager {

    func start() {
        analyticsManager.start()
        notificationManager.start()
    }

}
