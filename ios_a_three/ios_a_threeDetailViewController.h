//
//  ios_a_threeDetailViewController.h
//  ios_a_three
//
//  Created by Matthew Swann on 7/18/14.
//  Copyright (c) 2014 xmera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ios_a_threeDetailViewController : UIViewController


// Text Field Entry
@property (weak, nonatomic) IBOutlet UITextField *detailText;

@property (weak, nonatomic) IBOutlet UITextField *issueText;

@property (weak, nonatomic) IBOutlet UITextField *publisherText;

@property (weak, nonatomic) IBOutlet UITextField *writerText;

@property (weak, nonatomic) IBOutlet UITextField *illustratorText;

@property (weak, nonatomic) IBOutlet UITextField *inkerText;

// Date Field Entry
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

// Pointer to Item
@property (strong, nonatomic) id detailItem;

// Functions
- (IBAction)detailTextChanged:(UITextField *)sender;

- (IBAction)detailDateChanged:(id)sender;

// Keyboard Ending Functions
- (IBAction)textFieldDoneEditing:(id)sender;

- (IBAction)backgroundTap:(id)sender;

// configureView might replace this.
//-(void) initialize;

@end
