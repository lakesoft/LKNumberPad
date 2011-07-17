//
//  LKNumberPadAppDelegate.h
//  LKNumberPad
//
//  Created by Hiroshi Hashiguchi on 11/07/17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LKNumberPadViewController;

@interface LKNumberPadAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet LKNumberPadViewController *viewController;

@end
