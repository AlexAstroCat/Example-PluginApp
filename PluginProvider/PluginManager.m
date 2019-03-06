//
//  PluginManager.m
//  PluginProvider
//
//  Created by Michael Nachbaur on 2019-03-05.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

#import "PluginManager.h"
#import "TabProvider.h"

@implementation PluginManager {
    NSArray<Class> *_pluginClasses;
    NSArray<id<TabProvider>> *_tabProviders;
}

+ (PluginManager *)sharedManager {
    static PluginManager *result = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        result = PluginManager.new;
    });
    return result;
}

- (NSArray<Class>*)pluginClasses {
    if (!_pluginClasses) {
        NSURL *privateFrameworksUrl = [NSBundle mainBundle].privateFrameworksURL;
        NSError *error = nil;
        NSArray<NSURL*> *frameworkContents = [NSFileManager.defaultManager contentsOfDirectoryAtURL:privateFrameworksUrl
                                                                         includingPropertiesForKeys:nil
                                                                                            options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                                              error:&error];
        if (error) {
            NSLog(@"Error finding framework contents: %@", error);
        }
        
        NSMutableArray<Class> *result = NSMutableArray.new;
        for (NSURL *frameworkUrl in frameworkContents) {
            if (![frameworkUrl.pathExtension isEqualToString:@"framework"]) {
                continue;
            }
            
            NSBundle *bundle = [NSBundle bundleWithURL:frameworkUrl];
            if (bundle.principalClass == nil) {
                continue;
            }
            
            [result addObject:bundle.principalClass];
        }
        
        _pluginClasses = result.copy;
    }
    return _pluginClasses;
}

- (NSArray<id<TabProvider>> *)tabProviders {
    if (!_tabProviders) {
        NSMutableArray<id<TabProvider>> *tabProviders = NSMutableArray.new;

        for (Class tabProviderClass in self.pluginClasses) {
            if (![tabProviderClass conformsToProtocol:@protocol(TabProvider)]) {
                continue;
            }
            
            id<TabProvider> provider = [[tabProviderClass alloc] init];
            if (provider) {
                [tabProviders addObject:provider];
            }
        }
        _tabProviders = tabProviders.copy;
    }
    return _tabProviders;
}

- (NSArray<UIViewController*> *)tabViewControllers {
    NSMutableArray<UIViewController*> *tabControllers = NSMutableArray.new;

    for (id<TabProvider> tabProvider in self.tabProviders) {
        UIViewController *controller = [tabProvider newTabViewController];
        if (controller != nil) {
            [tabControllers addObject:controller];
        }
    }

    return tabControllers.copy;
}

@end
