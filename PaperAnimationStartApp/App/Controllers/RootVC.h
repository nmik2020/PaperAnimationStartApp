//
//  TopViewController.h
//  SlidingTest
//
//  Created by Scott Barron on 7/31/12.
//  Copyright (c) 2012 Scott Barron. All rights reserved.
//

@import UIKit;

@interface RootVC : UIViewController
@property(nonatomic) UILabel *titleLabel;
- (void)addTitleLabel;
- (void)animateTitleLabel:(id)sender;
- (void)setTitleLabel;
@end

