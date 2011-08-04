Custom Number Keypad
====================

LKNumberPadView class can display custom number keypad.

![](https://github.com/lakesoft/LKNumberPad/raw/master/image1.png)


Installation
-----------

You should copy below files to your projects.

 LKNumberPadView.h
 LKNumberPadView.m


Usage
-----

Setup

(1) Open Xib editor in Xcode4.

(2) Put UIView control on your view.

(3) Set LKNumberPadView on class property.

(4) Make the frame size to (320, 54).

(5) Set delegate outlet to File's owner.

(6) Set background color (option).


Use

Implement delegate methods:

	@protocol LKNumberPadViewDelegate 
	
	@optional
	- (void)didTouchNumberPadView:(LKNumberPadView*)numberPadView touchedString:(NSString*)string;
	- (void)didTouchNumberPadView:(LKNumberPadView*)numberPadView withSequentialString:(NSString*)string;
	
	@end

- didTouchNumberPadView:touchedString:
	This method is called by tapping a pad.

- didTouchNumberPadView:withSequentialString:
	This method is called by tapping a pad. The sequential taps is passed as string. (e.g.) tap 1, tap 4, tap 3 => @"143"



Customize
---------
The below properties can customize the view's behaivior.

- BOOL startWithZero ... NO:Start with 1 (default) / YES:Start with 0

- UIColor* keyboardColor ... Keyboard background color. default: [UIColor colorWithWhite:0.95 alpha:1.0]。

- UIColor* textColor ... Keytop text color. default: [UIColor blackColor]。

- UIColor* disabledKeyboardColor ... Keytop background color (disabled). default: [UIColor colorWithWhite:0.85 alpha:1.0]。

- UIColor* disabledTextColor ... Keytop text color (disabled). default: [UIColor lightGrayColor]。

- NSTimeInterval sequenceInterval ... Interval [sec] for sequentail key input. default: 0.75 [sec].

- NSSet* enabledSet ... Determine enable of keytop. The number is keytop number (not index).

		view.enabledSet = [NSSet setWithObjects:
			[NSNumber numberWithInt:1],
			[NSNumber numberWithInt:2], nil];

License
-------
MIT

Copyright (c) 2011 Hiroshi Hashiguchi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

