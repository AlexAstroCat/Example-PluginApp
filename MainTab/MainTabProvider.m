//
//  MainTabProvider.m
//  MainTab
//
//  Created by Michael Nachbaur on 2019-03-05.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//


#import "MainTabProvider.h"

@implementation MainTabProvider

- (UIViewController *)newTabViewController {
    return [[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle bundleForClass:self.class]] instantiateInitialViewController];
}

@end
