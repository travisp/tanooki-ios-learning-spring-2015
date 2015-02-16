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

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
}

@end
