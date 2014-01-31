//
//  MCDDetailViewController.h
//  AutoLayoutExample
//
//  Created by Mark Dorison on 1/31/14.
//  Copyright (c) 2014 MCD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCDDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
