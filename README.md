Inspired by Shawn Blanc's "[The Just Checks][tjs]" episode of The Weekly Briefly podcast. 

The _Just Checks_ are those times throughout the day when we 'just check' our phones: skim over our Twitter feeds, browse RSS, check our emails, etc. In Shawn's words:

> ... as soon as I’m holding my phone, it’s instinct at this point to swipe-to-unlock the thing. And then, once the phone is unlocked and I’m staring blankly at my Home screen of icons, I’m going to want to launch an app. But because I unlocked the phone without any clear plan for what I needed to do, the next thing I know I’m checking Twitter. And all the while, I don’t even know what time it is. See? It’s a bad habit.

<!-- ![The Just Checks Today Widget](/images/posts/2014-11-15-the-just-checks-widget.png) -->

I built this widget to help limit my own bad habits of 'just checking' Twitter and RSS many many times throughout the day. Apple doesn't allow widgets on the App Store that launch other apps, so I'm releasing the code on Github in case anybody else wants to try it out for themselves. The widget is currently set up to work with [Tweetbot][tb] and [Unread][unr], and uses their URL schemes to launch the apps. 

The idea is this: the widget displays an icon for Tweetbot and an icon for Unread. When an icon is tapped, the associated app is launched. The widget then keeps track of the amount of time since you launched that app. There's a timeout set so you can't relaunch an app through the widget more often than once every hour (because really, why should you need to?). I've also hidden my Tweetbot and Unread app icons away in a folder on the last home screen on my phone. This adds enough extra friction that I'm more likely to use the widget to launch my apps.

In the short time I've been using the widget, I've found that seeing the timer when I go to launch an app has been really effective at getting me to just put my phone back in my pocket. I've even caught myself going to check Twitter and realising that I'd only checked it 5 minutes ago, when I could've sworn it was much longer. I'll stop in my tracks, lock my phone, put it back in my pocket, and get on with my day.

Also worth checking out: Shawn Blanc's [Alternatives to The Just Checks][alternatives].

[tjs]: http://weeklybriefly.net/the-just-checks/
[tb]: http://tapbots.com/software/tweetbot/
[unr]: http://supertop.co/unread/
[alternatives]: http://shawnblanc.net/2014/11/alternatives-to-the-just-checks/
[github]: https://github.com/frosty/JustChecks