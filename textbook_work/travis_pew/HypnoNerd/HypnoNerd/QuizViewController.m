//
//  QuizViewController.m
//  Quiz
//
//  Created by Travis Pew on 2/2/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Create two arrays fills with questions and answers
        // and make the pointers point to them
        
        self.questions = @[@"From what is cognac made?",
                          @"What is 7+7?",
                          @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
        
        // Set the tab bar's item title
        self.tabBarItem.title = @"Quiz";
        
        // Create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Quiz.png"];
        
        // Put that item on the tab bar item
        self.tabBarItem.image = image;

    }
    
    // Return the address of the new object
    return self;
}


- (IBAction)showQuestion:(id)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    // Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at that index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    // What is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answer label
    self.answerLabel.text = answer;
}

@end
