//
//  ios_a_threeDetailViewController.h
//  ios_a_three
//
//  Created by Matthew Swann on 7/18/14.
//  Copyright (c) 2014 xmera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ios_a_threeDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *detailText;

@property (strong, nonatomic) id detailItem;

- (IBAction)detailTextChanged:(UITextField *)sender;

@end
