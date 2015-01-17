//
//  AppDelegate.h
//  BugsEverywhere
//
//  Created by xcode on 1/13/15.
//  Copyright (c) 2015 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end



    // BUILD DATA

    // 1) forgot to init an array

    // 2) for loop uses for(int x; instead of for(int x = 0;


    // TABLE VIEW

    // 1) tableView does not have its data source set

    // 2) numberOfRowsForSection is incorrect, resulting in NSRangeException

    // 3) in cellForRowAtIndexPath, give the label the object, not the desired text


    // SEGUE

    // 1) segue calls two methods, one deleted

    // 2) the sender is not self, so not running our code (should replace sender == self with self.nextButton

    // 3) the next view controller is using the description property and message properties, already used by apple

    // 4) didn't change class name in Storyboard, when set properties on nextVC, will not recognize them



