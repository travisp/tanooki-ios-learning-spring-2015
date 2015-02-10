//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Travis Pew on 2/9/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All HypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGPoint newPoint = CGPointMake(center.x + currentRadius, center.y);
        [path moveToPoint:newPoint];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw the line!
    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect logoRect = CGRectMake(center.x - (logoImage.size.width / 4.0),
                                 center.y - (logoImage.size.height / 4.0),
                                 logoImage.size.width / 2.0,
                                 logoImage.size.height / 2.0);

    
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 0.0, 1.0, 0.0, 1.0,   // Start color is green
                              1.0, 1.0, 0.0, 1.0 }; // End color is yellow
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace,
                                                                 components,
                                                                 locations,
                                                                2);
    CGPoint logoTopCenter = CGPointMake(logoRect.origin.x + (logoRect.size.width / 2.0),
                                     logoRect.origin.y);
    
    CGPoint logoBottomLeft = CGPointMake(logoRect.origin.x, logoRect.origin.y + logoRect.size.height);
    
    CGPoint logoBottomRight = CGPointMake(logoRect.origin.x + logoRect.size.width, logoRect.origin.y + logoRect.size.height);
  
    CGPoint logoBottomCenter = CGPointMake(logoTopCenter.x,
                                   logoRect.origin.y + logoRect.size.height);
    
    UIBezierPath *bezierTriangle = [UIBezierPath bezierPath];
    
    [bezierTriangle moveToPoint:logoTopCenter];
    [bezierTriangle addLineToPoint:logoBottomLeft];
    [bezierTriangle addLineToPoint:logoBottomRight];
    [bezierTriangle closePath];
    
    CGContextSaveGState(currentContext);
    [bezierTriangle addClip];
    CGContextDrawLinearGradient(currentContext,
                                gradient,
                                logoTopCenter,
                                logoBottomCenter,
                                0);
    CGContextRestoreGState(currentContext);
 
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    
    
    CGContextSaveGState(currentContext);
    
    CGContextSetShadow(currentContext, CGSizeMake(4,7), 3);
    
    // Draw stuff here, it will appear with a shadow
    [logoImage drawInRect:logoRect];
    
    CGContextRestoreGState(currentContext);
    
}


@end
