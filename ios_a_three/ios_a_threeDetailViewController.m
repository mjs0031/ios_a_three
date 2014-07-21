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
        self.detailText.text = [self.detailItem objectForKey:@"text"];
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

- (IBAction)detailTextChanged:(UITextField *)sender {
    [self.detailItem setObject:sender.text forKey:@"text"];
}
@end
