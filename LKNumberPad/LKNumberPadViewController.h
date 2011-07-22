//
//  LKNumberPadViewController.h
//  LKNumberPad
//
//  Created by Hiroshi Hashiguchi on 11/07/17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKNumberPadView.h"

@interface LKNumberPadViewController : UIViewController <LKNumberPadViewDelegate> {
    
    LKNumberPadView *numberPadView;
    UILabel *touchedCounterLabel;
    UILabel *comboLabel;
}
@property (nonatomic, retain) IBOutlet LKNumberPadView *numberPadView;
@property (nonatomic, retain) IBOutlet UILabel *touchedCounterLabel;
@property (nonatomic, retain) IBOutlet UILabel *comboLabel;

@end
