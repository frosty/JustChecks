//
//  Utilities.swift
//  JustChecking
//
//  Created by James Frost on 14/11/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import Foundation
import UIKit

extension NSTimeInterval {
    var hours: NSTimeInterval {
        return floor(self / 3600)
    }
    
    var minutes: NSTimeInterval {
        return floor((self / 60) % 60)
    }
    
    var seconds: NSTimeInterval {
        return floor(self % 60)
    }
}

struct TintableImage {
    let originalImage: UIImage
    let greyImage: UIImage
    
    func greyOutImageInImageView(imageView: UIImageView) {
        if let existingImage = imageView.image {
            if existingImage == originalImage {
                imageView.image = greyImage
            }
        }
    }
    
    func restoreImageInImageView(imageView: UIImageView) {
        if let existingImage = imageView.image {
            if existingImage == greyImage {
                imageView.image = originalImage
            }
        }
    }
}

extension UIImage {
    func greyscaleImage() -> UIImage? {
        let scaleFactor = UIScreen.mainScreen().scale
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let imageInfo: UInt32 = CGImageAlphaInfo.None.rawValue
        let bitmapInfo = CGBitmapInfo(imageInfo)
        let context = CGBitmapContextCreate(nil, UInt(self.size.width * scaleFactor), UInt(self.size.height * scaleFactor), 8, 0, colorSpace, bitmapInfo)
        
        CGContextScaleCTM(context, scaleFactor, scaleFactor)
        CGContextDrawImage(context, CGRect(origin: CGPointZero, size: self.size), self.CGImage)
        
        let imageRef = CGBitmapContextCreateImage(context)
        
        return UIImage(CGImage: imageRef)
    }
}
