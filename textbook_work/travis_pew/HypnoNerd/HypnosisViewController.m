//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Travis Pew on 2/16/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;    
}

@end
