//
//  LKNumberPadView.h
//  LKNumberPad
//
//  Created by Hiroshi Hashiguchi on 11/07/17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LKNumberPadViewDelegate;
@interface LKNumberPadView : UIView {
    
}
@property (nonatomic, assign) IBOutlet id <LKNumberPadViewDelegate> delegate;

// setting
@property (nonatomic, assign) BOOL startWithZero;
@property (nonatomic, retain) UIColor* keyboardColor;
@property (nonatomic, retain) UIColor* textColor;
@property (nonatomic, retain) UIColor* disabledKeyboardColor;
@property (nonatomic, retain) UIColor* disabledTextColor;
@property (nonatomic, assign) NSTimeInterval sequenceInterval;
@property (nonatomic, retain) NSSet* enabledSet;

// status
@property (nonatomic, retain) NSString* touchedString;
@property (nonatomic, retain) NSString* sequentialString;

@end


@protocol LKNumberPadViewDelegate <NSObject>

@optional
- (void)didTouchNumberPadView:(LKNumberPadView*)numberPadView touchedString:(NSString*)string;
- (void)didTouchNumberPadView:(LKNumberPadView*)numberPadView withSequentialString:(NSString*)string;

@end

