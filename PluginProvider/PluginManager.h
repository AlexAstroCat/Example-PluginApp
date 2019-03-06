//
//  PluginManager.h
//  PluginProvider
//
//  Created by Michael Nachbaur on 2019-03-05.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TabProvider;

/**
 Class used to manage plugins. This is implemented in a separate framework so that both the application, and the plugins, are able to reference the framework.
 */
@interface PluginManager : NSObject

/**
 Singleton property.
 */
@property (class, atomic, strong, readonly) PluginManager *sharedManager NS_SWIFT_NAME(shared);

/**
 Array of classes that support principle classes, capable of being used as a plugin.
 */
@property (nonatomic, strong, readonly) NSArray<Class> *pluginClasses;

/**
 Array of tab provider plugins.
 */
@property (nonatomic, strong, readonly) NSArray<id<TabProvider>> *tabProviders;

/**
 Returns the array of tab controllers exposed by the various plugins.

 @return Array of root tab view controllers.
 */
- (NSArray<UIViewController*> *)tabViewControllers;

@end

NS_ASSUME_NONNULL_END
