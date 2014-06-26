//
//  DetailViewController.h
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic, retain) UIView *detailView;

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic) int intVisual;

@end
