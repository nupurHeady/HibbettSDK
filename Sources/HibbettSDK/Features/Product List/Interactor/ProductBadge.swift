//
//  ProductBadge.swift
//  Hibbett
//
//  Created by Deepti Dhumavat on 3/10/21.
//  Copyright © 2021 Heady LLC. All rights reserved.
//

import Foundation

/// Product Badge Details
public struct ProductBadge : Swift.Decodable {
    
    /// Badge Label
    public let label: String
    
    /// Badge Text Color
    public let textColor: String
    
    ///  Badge Background Color
    public let backgroundColor: String
    
    enum CodingKeys: String, CodingKey {
        case label
        case textColor
        case backgroundColor
    }
    
    /// Initialize
    /// - Parameters:
    ///   - label: Badge label
    ///   - textColor: Badge text color
    ///   - backgroundColor: Badge background color
    init(label: String, textColor: String, backgroundColor: String) {
        self.label = label
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    public init(from decoder: Swift.Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let label = try? values.decode(String.self, forKey: .label)
        let textColor = try? values.decode(String.self, forKey: .textColor)
        let backgroundColor = try? values.decode(String.self, forKey: .backgroundColor)
        
        self.init(label: label ?? "",
                  textColor: textColor ?? "",
                  backgroundColor: backgroundColor ?? "")
    }
}
