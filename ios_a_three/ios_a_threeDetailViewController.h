//
//  ios_a_threeDetailViewController.h
//  ios_a_three
//
//  Created by Matthew Swann on 7/18/14.
//  Copyright (c) 2014 xmera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ios_a_threeDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
