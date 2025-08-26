//
//  NotificationManager.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/17/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

public protocol NotificationManager {

    /// Starts the notification manager.
    func start()

    /// Registers the app to push notifications.
    ///
    /// - Parameter completion: The access request result completion.
    func registerNotifications(completion: @escaping (Bool, Swift.Error?) -> Void)
    
    /// Indicates application callback happened notifying that device registered for remote notifications.
    ///
    /// - Parameter deviceToken: Device token.
    func didRegisterForRemoteNotificationsWithDeviceToken(_ deviceToken: Data)
    
    /// Indicates application callback happened when a remote notification was received.
    ///
    /// - Parameters:
    ///   - application: Applicatino.
    ///   - userInfo: User info.
    ///   - completionHandler: Completion.
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)

    /// Clears the notification badge from the app icon.
    func clearNotificationBadgeFromAppIcon()

}
