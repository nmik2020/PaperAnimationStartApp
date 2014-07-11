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
    [self.button1 setHidden:YES];
    [self.button2 setHidden:YES];
    [self.button3 setHidden:YES];
    [self.button4 setHidden:YES];
    [self.titleLabel setHidden:YES];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
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
    [self setButtonCategories];
    [self animate:self];
}

/*
 Tags can be used to identify the category of answers selected
 */
-(void)setButtonCategories
{
    self.button1.tag = 1;
    self.button2.tag = 2;
}

- (IBAction)animate:(id)sender {
    [self animateTitleLabel:self];
    [self animateButton1:self.button1];
    [self animateButton2:self.button2];
    [self animateButton3:self.button3];
    [self animateButton4:self.button4];

}

- (void)animateTitleLabel:(id)sender
{
    CGFloat toValue = CGRectGetMidX(self.view.bounds);
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.toValue = @(toValue);
    onscreenAnimation.springBounciness = 12.f;
    [self setTitleLabel];
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(-toValue);
    offscreenAnimation.duration = 0.8f;

    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self.titleLabel setHidden:NO];
        [self setTitleLabel];
        [self.titleLabel.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
    }];
    [self.titleLabel.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

- (void)animateButton1:(id)sender
{
    CGFloat toValue = 90;
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.springBounciness = 12.f;
    onscreenAnimation.toValue = @(toValue);


    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation easeInAnimation];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(-toValue);

    offscreenAnimation.duration = 0.8f;
    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self.button1.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
        [self.button1 setHidden:NO];
    }];
    [self.button1.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

- (void)animateButton2:(id)sender
{
    CGFloat toValue = 230;
    
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.toValue = @(toValue);
    onscreenAnimation.springBounciness = 12.f;
    
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation easeInAnimation];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(toValue+toValue);
    offscreenAnimation.duration = 0.8f;
    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self.button2.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
        [self.button2 setHidden:NO];
    }];
    [self.button2.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

- (void)animateButton3:(id)sender
{
    CGFloat toValue = 90;
    
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.toValue = @(toValue);
    onscreenAnimation.springBounciness = 12.f;
    
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation easeInAnimation];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(-toValue);
    offscreenAnimation.duration = 0.8f;
    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self.button3.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
        [self.button3 setHidden:NO];
    }];
    [self.button3.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}

- (void)animateButton4:(id)sender
{
    CGFloat toValue = 230;
    
    POPSpringAnimation *onscreenAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    onscreenAnimation.toValue = @(toValue);
    onscreenAnimation.springBounciness = 12.f;
    
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation easeInAnimation];
    offscreenAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
    offscreenAnimation.toValue = @(toValue+toValue);
    offscreenAnimation.duration = 0.8f;
    [offscreenAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self.button4.layer pop_addAnimation:onscreenAnimation forKey:@"onscreenAnimation"];
        [self.button4 setHidden:NO];
    }];
    [self.button4.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
}
- (void)setTitleLabel
{
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    NSString* title = @"Which one gives you the MOST fullfilment in life?";
    self.titleLabel.text = title;
}



@end
