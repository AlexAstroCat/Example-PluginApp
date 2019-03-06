//
//  AppDelegate.m
//  PluginApp
//
//  Created by Michael Nachbaur on 2019-03-05.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

#import <PluginProvider/PluginProvider.h>

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UITabBarController *tabBarController = nil;
    if ([self.window.rootViewController isKindOfClass:UITabBarController.class]) {
        tabBarController = (UITabBarController*)self.window.rootViewController;
    }
    
    tabBarController.viewControllers = PluginManager.sharedManager.tabViewControllers;
    
    return YES;
}

@end
