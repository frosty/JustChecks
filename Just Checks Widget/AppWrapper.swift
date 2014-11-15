//
//  AppWrapper.swift
//  JustChecking
//
//  Created by James Frost on 14/11/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import Foundation
import UIKit

let AppRelaunchTimeout: NSTimeInterval = 60 * 30   // 30 mins

class AppWrapper {
    let imageView: UIImageView
    let timerLabel: UILabel
    let launchURL: NSURL

    var lastLaunchDate: NSDate?
    var userDefaultsKey: String {
        return "last-launch-date-\(launchURL.scheme)"
    }
    
    var image: TintableImage?
    
    init(launchURLScheme: String, imageView: UIImageView, timerLabel: UILabel) {
        self.imageView = imageView
        self.timerLabel = timerLabel
        self.launchURL = NSURL(string: launchURLScheme)!
        
        if let imageViewImage = imageView.image {
            self.image = TintableImage(originalImage: imageViewImage, greyImage: imageViewImage.greyscaleImage()!)
        }
        
        self.lastLaunchDate = NSUserDefaults.standardUserDefaults().valueForKey(userDefaultsKey) as? NSDate
    }
    
    func update() {
        if let lastLaunchDate = self.lastLaunchDate {
            let interval = NSDate().timeIntervalSinceDate(lastLaunchDate)
            timerLabel.text = "\(Int(interval.hours))h \(Int(interval.minutes))m \(Int(interval.seconds))s"
            
            if interval < AppRelaunchTimeout {
                image?.greyOutImageInImageView(imageView)
            } else {
                image?.restoreImageInImageView(imageView)
            }
        }
    }
    
    func handleTap(sender: UIViewController) {
        if let lastLaunchDate = self.lastLaunchDate {
            let interval = NSDate().timeIntervalSinceDate(lastLaunchDate)
            if interval > AppRelaunchTimeout {
                launchAppFromContext(sender.extensionContext)
            }
        } else {
            launchAppFromContext(sender.extensionContext)
        }
    }
    
    func launchAppFromContext(extensionContext: NSExtensionContext?) {
        let date = NSDate()
        NSUserDefaults.standardUserDefaults().setValue(date, forKey: userDefaultsKey)
        self.lastLaunchDate = date
    
        extensionContext?.openURL(launchURL, completionHandler: nil)
    }
}