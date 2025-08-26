//
//  DeviceHelper.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/10/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

/// Checks if the device is an iOS simulator.
///
/// - See also: [Source](http://stackoverflow.com/a/24869607/3643020)
///
/// - Returns: `true` if the current device is a Simulator. `false` if not.
public func isSimulator() -> Bool {
    #if targetEnvironment(simulator)
        return true
    #else
        return false
    #endif
}
