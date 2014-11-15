//
//  TodayViewController.swift
//  AppLauncher
//
//  Created by James Frost on 09/11/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var timer: NSTimer!
    
    @IBOutlet weak var leftTimerLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!

    @IBOutlet weak var rightTimerLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!

    var leftApp: AppWrapper!
    var rightApp: AppWrapper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftApp = AppWrapper(launchURLScheme: "tweetbot:///", imageView: leftImageView, timerLabel: leftTimerLabel)
        rightApp = AppWrapper(launchURLScheme: "unread:///", imageView: rightImageView, timerLabel: rightTimerLabel)
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        completionHandler(NCUpdateResult.NewData)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (timer == nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerTicked:", userInfo: nil, repeats: true)
        }
        
        updateLabel()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.invalidate()
        timer = nil
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 20, 0, 20)
    }
    
    func timerTicked(timer: NSTimer) {
        updateLabel()
    }
    
    func updateLabel() {
        leftApp.update()
        rightApp.update()
    }
    
    @IBAction func appTapped(sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView {
            if imageView == leftApp.imageView {
                leftApp.handleTap(self)
            } else if imageView == rightApp.imageView {
                rightApp.handleTap(self)
            }
        }
    }
}
