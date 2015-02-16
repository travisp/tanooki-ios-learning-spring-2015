//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Travis Pew on 2/16/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import "ReminderViewController.h"
#import <UIKit/UIKit.h>

@interface ReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation ReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil

{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        // Set the tab bar's item title
        self.tabBarItem.title = @"Reminder";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        
        // Put that item on the tab bar item
        self.tabBarItem.image = image;
    }
    
    return self;
}


- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:
     [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert)
                                       categories:nil]];
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end
