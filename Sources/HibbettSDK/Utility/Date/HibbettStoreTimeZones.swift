//
//  HibbettStoreTimeZones.swift
//  HibbettSDK
//
//  Created by Kamal Wadhwa on 30/07/24.
//  Copyright © 2024 Heady LLC. All rights reserved.
//

import Foundation

public enum HibbettStoreTimeZones: String, Codable {
    case CT, ET, MT, PT

    public var timezone: String {
        switch self {
        case .CT: return "America/Chicago"
        case .ET: return "America/New_York"
        case .MT: return "America/Phoenix"
        case .PT: return "America/Los_Angeles"
        }
    }
}
