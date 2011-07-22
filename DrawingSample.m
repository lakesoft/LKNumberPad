//
//  DrawingSample.m
//  LKNumberPad
//
//  Created by Hiroshi Hashiguchi on 11/07/17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawingSample.h"


@implementation DrawingSample

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

#define LKNUMBERPADVIEW_PAN_SHADOW_OFFSET_X 0
#define LKNUMBERPADVIEW_PAN_SHADOW_OFFSET_Y 0.5
#define LKNUMBERPADVIEW_PAN_SHADOW_BLUR     20.0

#define LKNUMBERPADVIEW_PAN_RADIUS  10.0
#define LKNUMBERPADVIEW_PAN_WIDTH   54.0
#define LKNUMBERPADVIEW_PAN_UPPER_HEIGHT    55.0
#define LKNUMBERPADVIEW_PAN_LOWER_WIDTH     32.0
#define LKNUMBERPADVIEW_PAN_LOWER_HEIGHT    30.0
#define LKNUMBERPADVIEW_PAN_UL_WIDTH        (LKNUMBERPADVIEW_PAN_UPPER_HEIGHT-LKNUMBERPADVIEW_PAN_LOWER_WIDTH)
#define LKNUMBERPADVIEW_PAN_MIDDLE_HEIGHT    20.0

#define LKNUMBERPADVIEW_PAN_CURVE_SIZE      5.0


- (void)drawRect:(CGRect)rect
{
    CGMutablePathRef path = CGPathCreateMutable();

    CGPoint p = CGPointMake(20.0, 20.0);
    CGPoint p1, p2;
    
    p.x += LKNUMBERPADVIEW_PAN_RADIUS;
    CGPathMoveToPoint(path, NULL, p.x, p.y);
    
    p.x += LKNUMBERPADVIEW_PAN_WIDTH - LKNUMBERPADVIEW_PAN_RADIUS*2.0;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    p.y += LKNUMBERPADVIEW_PAN_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 LKNUMBERPADVIEW_PAN_RADIUS,
                 3.0*M_PI/2.0,
                 4.0*M_PI/2.0,
                 false);
    
    
    p.x += LKNUMBERPADVIEW_PAN_RADIUS;
    p.y += LKNUMBERPADVIEW_PAN_UPPER_HEIGHT - LKNUMBERPADVIEW_PAN_RADIUS - LKNUMBERPADVIEW_PAN_CURVE_SIZE;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    p1 = CGPointMake(p.x, p.y + LKNUMBERPADVIEW_PAN_CURVE_SIZE);
    p.x -= LKNUMBERPADVIEW_PAN_RADIUS;
    p.y += LKNUMBERPADVIEW_PAN_MIDDLE_HEIGHT + LKNUMBERPADVIEW_PAN_CURVE_SIZE*2;
    p2 = CGPointMake(p.x, p.y - LKNUMBERPADVIEW_PAN_CURVE_SIZE);
    CGPathAddCurveToPoint(path, NULL,
                          p1.x, p1.y,
                          p2.x, p2.y,
                          p.x, p.y);
    
    p.y += LKNUMBERPADVIEW_PAN_LOWER_HEIGHT - LKNUMBERPADVIEW_PAN_CURVE_SIZE - LKNUMBERPADVIEW_PAN_RADIUS;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    p.x -= LKNUMBERPADVIEW_PAN_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 LKNUMBERPADVIEW_PAN_RADIUS,
                 4.0*M_PI/2.0,
                 1.0*M_PI/2.0,
                 false);
    
    p.x -= LKNUMBERPADVIEW_PAN_UL_WIDTH - LKNUMBERPADVIEW_PAN_RADIUS;
    p.y += LKNUMBERPADVIEW_PAN_RADIUS;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    p.y -= LKNUMBERPADVIEW_PAN_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 LKNUMBERPADVIEW_PAN_RADIUS,
                 1.0*M_PI/2.0,
                 2.0*M_PI/2.0,
                 false);
    
    p.x -= LKNUMBERPADVIEW_PAN_RADIUS;
    p.y -= LKNUMBERPADVIEW_PAN_LOWER_HEIGHT - LKNUMBERPADVIEW_PAN_RADIUS - LKNUMBERPADVIEW_PAN_CURVE_SIZE;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    p1 = CGPointMake(p.x, p.y - LKNUMBERPADVIEW_PAN_CURVE_SIZE);
    p.x -= LKNUMBERPADVIEW_PAN_RADIUS;
    p.y -= LKNUMBERPADVIEW_PAN_MIDDLE_HEIGHT + LKNUMBERPADVIEW_PAN_CURVE_SIZE*2;
    p2 = CGPointMake(p.x, p.y + LKNUMBERPADVIEW_PAN_CURVE_SIZE);
    CGPathAddCurveToPoint(path, NULL,
                          p1.x, p1.y,
                          p2.x, p2.y,
                          p.x, p.y);
    
    p.y -= LKNUMBERPADVIEW_PAN_UPPER_HEIGHT - LKNUMBERPADVIEW_PAN_RADIUS - LKNUMBERPADVIEW_PAN_CURVE_SIZE;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    p.x += LKNUMBERPADVIEW_PAN_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 LKNUMBERPADVIEW_PAN_RADIUS,
                 2.0*M_PI/2.0,
                 3.0*M_PI/2.0,
                 false);

    
    //----
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);

    
    // draw shadow
    CGColorRef shadowColorRef = [[UIColor blackColor] CGColor];
    CGContextSetShadowWithColor(context,
                                CGSizeMake(LKNUMBERPADVIEW_PAN_SHADOW_OFFSET_X,
                                           LKNUMBERPADVIEW_PAN_SHADOW_OFFSET_Y),
                                LKNUMBERPADVIEW_PAN_SHADOW_BLUR,
                                shadowColorRef
                                );
    CGContextFillPath(context);

    CGContextAddPath(context, path);
    CGContextClip(context);
    
    // draw gradient
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGFloat components[] = { 1.0f, 1.0f,
        0.8f, 1.0f,
        1.0f, 1.0f};
    
    
    size_t count = sizeof(components)/ (sizeof(CGFloat)* 2);

//    CGContextAddRect(context, self.frame);
    
    CGRect frame = CGContextGetClipBoundingBox(context);
    NSLog(@"%@", NSStringFromCGRect(frame));
    CGPoint startPoint = frame.origin;
    CGPoint endPoint = frame.origin;
    endPoint.y = frame.origin.y + frame.size.height;
    
    CGGradientRef gradientRef =
    CGGradientCreateWithColorComponents(colorSpaceRef, components, NULL, count);
    
    CGContextDrawLinearGradient(context,
                                gradientRef,
                                startPoint,
                                endPoint,
                                kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradientRef);
    CGColorSpaceRelease(colorSpaceRef);

    // draw text
    NSString* string = @"5";
    
    UIFont* font = [UIFont boldSystemFontOfSize:44.0];
    CGSize size = [string sizeWithFont:font];
    CGRect textFrame = CGContextGetClipBoundingBox(context);
    textFrame.size.height = LKNUMBERPADVIEW_PAN_UPPER_HEIGHT;
    
    textFrame.origin.x += (textFrame.size.width - size.width)/2.0;
    textFrame.origin.y += (textFrame.size.height - size.height)/2.0;

    shadowColorRef = [[UIColor whiteColor] CGColor];
    CGContextSetShadowWithColor(context,
                                CGSizeMake(0.0,
                                           1.0),
                                1.0,
                                shadowColorRef
                                );

    [[UIColor blackColor] set];
    [string drawAtPoint:textFrame.origin withFont:font];
    
    CFRelease(path);
}

- (void)drawRect___:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();    
    
    CGColorRef shadowColorRef = [[UIColor blackColor] CGColor];
    CGContextSetShadowWithColor(context,
                                CGSizeMake(LKNUMBERPADVIEW_PAN_SHADOW_OFFSET_X,
                                           LKNUMBERPADVIEW_PAN_SHADOW_OFFSET_Y),
                                LKNUMBERPADVIEW_PAN_SHADOW_BLUR,
                                shadowColorRef
                                );
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    CGPoint p = CGPointMake(20.0, 20.0);
    CGPoint p1, p2;
    
    p.x += LKNUMBERPADVIEW_PAN_RADIUS;
    [path moveToPoint:p];
    
    p.x += LKNUMBERPADVIEW_PAN_WIDTH - LKNUMBERPADVIEW_PAN_RADIUS*2.0;
    [path addLineToPoint:p];
    
    p.y += LKNUMBERPADVIEW_PAN_RADIUS;
    [path addArcWithCenter:p
                    radius:LKNUMBERPADVIEW_PAN_RADIUS
                startAngle:3.0*M_PI/2.0
                  endAngle:4.0*M_PI/2.0
                 clockwise:YES];
    
    p.x += LKNUMBERPADVIEW_PAN_RADIUS;
    p.y += LKNUMBERPADVIEW_PAN_UPPER_HEIGHT - LKNUMBERPADVIEW_PAN_RADIUS - LKNUMBERPADVIEW_PAN_CURVE_SIZE;
    [path addLineToPoint:p];
    
    p1 = CGPointMake(p.x, p.y + LKNUMBERPADVIEW_PAN_CURVE_SIZE);
    p.x -= LKNUMBERPADVIEW_PAN_RADIUS;
    p.y += LKNUMBERPADVIEW_PAN_MIDDLE_HEIGHT + LKNUMBERPADVIEW_PAN_CURVE_SIZE*2;
    p2 = CGPointMake(p.x, p.y - LKNUMBERPADVIEW_PAN_CURVE_SIZE);
    [path addCurveToPoint:p controlPoint1:p1 controlPoint2:p2];
    
    p.y += LKNUMBERPADVIEW_PAN_LOWER_HEIGHT - LKNUMBERPADVIEW_PAN_CURVE_SIZE - LKNUMBERPADVIEW_PAN_RADIUS;
    [path addLineToPoint:p];
    
    p.x -= LKNUMBERPADVIEW_PAN_RADIUS;
    [path addArcWithCenter:p
                    radius:LKNUMBERPADVIEW_PAN_RADIUS
                startAngle:0*M_PI/2.0
                  endAngle:1.0*M_PI/2.0
                 clockwise:YES];
    
    p.x -= LKNUMBERPADVIEW_PAN_UL_WIDTH - LKNUMBERPADVIEW_PAN_RADIUS;
    p.y += LKNUMBERPADVIEW_PAN_RADIUS;
    [path addLineToPoint:p];
    
    p.y -= LKNUMBERPADVIEW_PAN_RADIUS;
    [path addArcWithCenter:p
                    radius:LKNUMBERPADVIEW_PAN_RADIUS
                startAngle:1*M_PI/2.0
                  endAngle:2.0*M_PI/2.0
                 clockwise:YES];
    
    p.x -= LKNUMBERPADVIEW_PAN_RADIUS;
    p.y -= LKNUMBERPADVIEW_PAN_LOWER_HEIGHT - LKNUMBERPADVIEW_PAN_RADIUS - LKNUMBERPADVIEW_PAN_CURVE_SIZE;
    [path addLineToPoint:p];
    
    p1 = CGPointMake(p.x, p.y - LKNUMBERPADVIEW_PAN_CURVE_SIZE);
    p.x -= LKNUMBERPADVIEW_PAN_RADIUS;
    p.y -= LKNUMBERPADVIEW_PAN_MIDDLE_HEIGHT + LKNUMBERPADVIEW_PAN_CURVE_SIZE*2;
    p2 = CGPointMake(p.x, p.y + LKNUMBERPADVIEW_PAN_CURVE_SIZE);
    [path addCurveToPoint:p controlPoint1:p1 controlPoint2:p2];
    
    p.y -= LKNUMBERPADVIEW_PAN_UPPER_HEIGHT - LKNUMBERPADVIEW_PAN_RADIUS - LKNUMBERPADVIEW_PAN_CURVE_SIZE;
    [path addLineToPoint:p];
    
    p.x += LKNUMBERPADVIEW_PAN_RADIUS;
    [path addArcWithCenter:p
                    radius:LKNUMBERPADVIEW_PAN_RADIUS
                startAngle:2*M_PI/2.0
                  endAngle:3.0*M_PI/2.0
                 clockwise:YES];
    
    [path closePath];
    [path fill];
    
    [path addClip];
    
    // setup gradient
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
    CGFloat components[] = { 1.0f, 1.0f,
        0.8f, 1.0f,
        1.0f, 1.0f};
    
    
    size_t count = sizeof(components)/ (sizeof(CGFloat)* 2);
    
    CGContextAddRect(context, self.frame);
    
    CGRect frame = [path bounds];
    NSLog(@"%@", NSStringFromCGRect(frame));
    CGPoint startPoint = frame.origin;
    CGPoint endPoint = frame.origin;
    endPoint.y = frame.origin.y + frame.size.height;
    
    CGGradientRef gradientRef =
    CGGradientCreateWithColorComponents(colorSpaceRef, components, NULL, count);
    
    CGContextDrawLinearGradient(context,
                                gradientRef,
                                startPoint,
                                endPoint,
                                kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradientRef);
    CGColorSpaceRelease(colorSpaceRef);
    
    // draw text
    NSString* string = @"5";
    
    UIFont* font = [UIFont boldSystemFontOfSize:44.0];
    CGSize size = [string sizeWithFont:font];
    CGRect textFrame = [path bounds];
    textFrame.size.height = LKNUMBERPADVIEW_PAN_UPPER_HEIGHT;
    
    textFrame.origin.x += (textFrame.size.width - size.width)/2.0;
    textFrame.origin.y += (textFrame.size.height - size.height)/2.0;
    
    shadowColorRef = [[UIColor whiteColor] CGColor];
    CGContextSetShadowWithColor(context,
                                CGSizeMake(0.0,
                                           1.0),
                                1.0,
                                shadowColorRef
                                );
    
    [[UIColor blackColor] set];
    [string drawAtPoint:textFrame.origin withFont:font];
}

- (void)dealloc
{
    [super dealloc];
}

@end
