//
//  TopViewController.m
//  SlidingTest
//
//  Created by Scott Barron on 7/31/12.
//  Copyright (c) 2012 Scott Barron. All rights reserved.
//

#import "RootVC.h"
#import "AppDelegate.h"
#import <POP/POP.h>

@implementation RootVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
       [self addTitleLabel];
}

# pragma mark - Private Instance methods

- (void)addTitleLabel
{
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Light" size:16.f];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    [self setTitleLabel];
    NSString *title = @"";
    if ([self.titleLabel.text isEqualToString:title]) {
        title = @"Which one gives you the MOST fullfilment in life?";
    }
    self.titleLabel.text = title;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.titleLabel];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[_titleLabel]-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_titleLabel)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-(80)-[_titleLabel]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_titleLabel)]];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[_button1]-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_button1)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-(80)-[_button2]"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_button2)]];
}
- (IBAction)animate:(id)sender {
    [self animateTitleLabel:self];
    [self animateButton1:self];
    [self animateButton2:self];
}

- (void)animateTitleLabel:(id)sender
{
    CGFloat toValue = CGRectGetMidX(self.view.bounds);
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.toValue = @(toValue);
    onscreenAnimation.springBounciness = 20.f;
    [self setTitleLabel];
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(-toValue);
    offscreenAnimation.duration = 0.8f;

    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self setTitleLabel];
        [self.titleLabel.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
    }];
    [self.titleLabel.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

- (void)animateButton1:(id)sender
{
    CGFloat toValue = CGRectGetMidX(self.view.bounds);
    
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.toValue = @(toValue);
    onscreenAnimation.springBounciness = 10.f;
    
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation easeInAnimation];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(-toValue);
    offscreenAnimation.duration = 0.8f;
    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self.button1.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
    }];
    [self.button1.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

- (void)animateButton2:(id)sender
{
    CGFloat toValue = CGRectGetMidX(self.view.bounds);
    
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.toValue = @(toValue+toValue);
    onscreenAnimation.springBounciness = 10.f;
    
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation easeInAnimation];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(toValue);
    offscreenAnimation.duration = 0.8f;
    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self.button2.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
    }];
    [self.button2.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

- (void)setTitleLabel
{
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    NSString* title = @"Which one gives you the MOST fullfilment in life?";
    self.titleLabel.text = title;
}



@end
