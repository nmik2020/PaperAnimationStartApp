//
//  AppDelegate.m
//  
//
//  Created by Phil Wright
//  Copyright (c) 2014 Touchopia, LLC. All rights reserved.
//

@import UIKit;
@import SystemConfiguration;
@import Social;

#import "AppDelegate.h"
#import "RootVC.h"
#import "Constants.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Force light sytatus bar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Default Font
    [[UILabel appearance] setFont:[UIFont fontWithName:kDefaultFont size:kDefaultFontSize]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    RootVC *rootController = [[RootVC alloc] initWithNibName:@"RootVC" bundle:nil];

    _navigationController = [[UINavigationController alloc] initWithRootViewController:rootController];
    [_navigationController setNavigationBarHidden:YES];
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
