//
//  ios_a_threeDetailViewController.m
//  ios_a_three
//
//  Created by Matthew Swann on 7/18/14.
//  Copyright (c) 2014 xmera. All rights reserved.
//

#import "ios_a_threeDetailViewController.h"

@interface ios_a_threeDetailViewController ()

- (void)configureView;

@end

@implementation ios_a_threeDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        
        self.detailText.text      = [self.detailItem objectForKey:@"text"];
        self.issueText.text       = [self.detailItem objectForKey:@"issueText"];
        self.publisherText.text   = [self.detailItem objectForKey:@"publisherText"];
        self.writerText.text      = [self.detailItem objectForKey:@"writerText"];
        self.illustratorText.text = [self.detailItem objectForKey:@"illustratorText"];
        self.inkerText.text       = [self.detailItem objectForKey:@"inkerText"];
        
        NSDate *date = [self.detailItem objectForKey:@"dateText"];
        
        if (date) {
        
            [self.datePicker setDate:date];
        }
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    [self configureView];
    
    self.detailText.text = [self.detailItem objectForKey:@"text"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 Badly written force on date change
 */
- (IBAction)detailDateChanged:(id)sender{
    
    [self.detailItem setObject:[self.datePicker date] forKey:@"dateText"];
    
} // end detailDateChanged()

/**
 Badly written force on the text field changes
 */
- (IBAction)detailTextChanged:(UITextField *)sender {
    
    //[self.detailItem setObject:sender.text forKey:@"text"];
    
    ///*
    switch(sender.tag){
            
        case 1:
            
            [self.detailItem setObject:sender.text forKey:@"text"];
            break;
        
        case 2:
            [self.detailItem setObject:sender.text forKey:@"issueText"];
            break;
            
        case 3:
            [self.detailItem setObject:sender.text forKey:@"publisherText"];
            break;
            
        case 4:
            [self.detailItem setObject:sender.text forKey:@"writerText"];
            break;
            
        case 5:
            [self.detailItem setObject:sender.text forKey:@"illustratorText"];
            break;
            
        case 6:
            [self.detailItem setObject:sender.text forKey:@"inkerText"];
            break;
            
        default:
            break;
            
    }
     //*/
} // end detailTextChanged()

- (IBAction)textFieldDoneEditing:(id)sender {
    
    [sender resignFirstResponder];
}


- (IBAction)backgroundTap:(id)sender {
    
    [self.detailText      resignFirstResponder];
    [self.issueText       resignFirstResponder];
    [self.publisherText   resignFirstResponder];
    [self.writerText      resignFirstResponder];
    [self.illustratorText resignFirstResponder];
    [self.inkerText       resignFirstResponder];
}

@end
