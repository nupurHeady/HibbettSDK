//
//  ImageDownloader.swift
//  Hibbett
//
//  Created by Thibault Klein on 5/31/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit
import Optik

/// Image downloader protocol.
public protocol ImageDownloader: Optik.ImageDownloader {

    /// Downloads and sets the image from the given URL.
    /// Placeholder image is displayed while the image is being downloaded, and then replaced by the downloaded image.
    ///
    /// - Parameters:
    ///   - imageView: The image view to set.
    ///   - url: The image URL to use.
    ///   - placeholderImage: The placeholder image to use.
    ///   - runImageTransitionIfCached: Whether or not to run the image transition for cached images.
    ///   - completion: The completion block.
    func setImage(toImageView imageView: UIImageView,
                  using url: URL?,
                  placeholderImage: UIImage?,
                  runImageTransitionIfCached: Bool,
                  completion: ((UIImage?) -> Void)?)
    
    /**
     Downloads image and returns it in completion handler.
     
     - parameter url:        Image URL.
     - parameter completion: Completion block for downloaded image.
     */
    func downloadImage(from url: URL, completion: @escaping ImageDownloaderCompletion)

}
