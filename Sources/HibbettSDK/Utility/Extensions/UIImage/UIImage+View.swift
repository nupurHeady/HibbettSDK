//
//  UIImage+View.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/26/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UIImage {

    /// Creates an image based on a given rectangle.
    ///
    /// - Parameters:
    ///   - rect: The rectangle to use.
    ///   - color: The color to fill the image with.
    /// - Returns: The final image.
    static func image(fromRect rect: CGRect, withColor color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    /// Creates an image based on given color
    ///
    /// - Parameter color: Color from which image needs to be created
    /// - Returns: The final image with specified color
    func colorImage(with color: UIColor) -> UIImage? {
        guard let cgImage = self.cgImage else { return nil }
        UIGraphicsBeginImageContext(self.size)
        let contextRef = UIGraphicsGetCurrentContext()
        
        contextRef?.translateBy(x: 0, y: self.size.height)
        contextRef?.scaleBy(x: 1.0, y: -1.0)
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        contextRef?.setBlendMode(CGBlendMode.normal)
        contextRef?.draw(cgImage, in: rect)
        contextRef?.setBlendMode(CGBlendMode.sourceIn)
        color.setFill()
        contextRef?.fill(rect)
        
        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return coloredImage
    }
}
