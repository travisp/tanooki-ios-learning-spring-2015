//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Travis Pew on 2/16/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController()
@property(nonatomic, weak) HypnosisView *viewReference;
@end

@implementation HypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil

{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        // Set the tab bar's item title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        // Put that item on the tab bar item
        self.tabBarItem.image = image;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view");
}

-(void) colorSelected:(id)sender
{
     UISegmentedControl *sc = (UISegmentedControl *)sender;
    
    NSString *selectedString = [sc titleForSegmentAtIndex: [sc selectedSegmentIndex]];
    
    UIColor *color;
    
    if( [selectedString isEqualToString:@"Red"] ){
        color = [UIColor redColor];
    }else if ( [selectedString isEqualToString:@"Green"] ){
        color = [UIColor greenColor];
    }else if ( [selectedString isEqualToString:@"Blue"] ){
        color = [UIColor blueColor];
    }
    
    self.viewReference.circleColor = color;
}

- (void)loadView
{
    // Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    NSArray *items = @[@"Red", @"Green", @"Blue"];
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:items];
    CGRect sframe = segmented.frame;
    sframe.origin.y = 100;
    sframe.origin.x = (frame.size.width - sframe.size.width) / 2;
    segmented.frame = sframe;
    
    
    [segmented addTarget:self
                  action:@selector(colorSelected:)
        forControlEvents:UIControlEventValueChanged];
    
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    [backgroundView addSubview:segmented];
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
    self.viewReference = backgroundView;
}

@end
