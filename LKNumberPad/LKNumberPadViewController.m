//
//  LKNumberPadViewController.m
//  LKNumberPad
//
//  Created by Hiroshi Hashiguchi on 11/07/17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LKNumberPadViewController.h"
#import "LKNumberPadView.h"

@implementation LKNumberPadViewController
@synthesize numberPadView = numberPadView_;
@synthesize touchedCounterLabel;
@synthesize comboLabel;

- (void)dealloc
{
    [numberPadView release];
    [touchedCounterLabel release];
    [comboLabel release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.numberPadView.enabledSet = [NSSet setWithObjects:
                                     [NSNumber numberWithInt:1],
                                     [NSNumber numberWithInt:2],
                                     [NSNumber numberWithInt:3],
                                     [NSNumber numberWithInt:4],
                                      [NSNumber numberWithInt:8], nil];
    self.numberPadView.keyboardColor = [UIColor yellowColor];
}

- (void)viewDidUnload
{
    [self setNumberPadView:nil];
    [self setTouchedCounterLabel:nil];
    [self setComboLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark -
#pragma mark LKNumberPadViewDelegate
- (void)didTouchNumberPadView:(LKNumberPadView*)numberPadView touchedString:(NSString*)string
{
    self.touchedCounterLabel.text = string;
}

- (void)didTouchNumberPadView:(LKNumberPadView*)numberPadView withSequentialString:(NSString*)string
{
    self.comboLabel.text = string;
}


@end
