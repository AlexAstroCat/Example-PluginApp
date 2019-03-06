//
//  TabProvider.h
//  PluginApp
//
//  Created by Michael Nachbaur on 2019-03-05.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Protocol used by plugins to expose their root-level tab view controllers.
 */
@protocol TabProvider <NSObject>

/**
 Method to return a new tab view controller, or `nil` if none is supported.

 @return View controller.
 */
+ (nullable UIViewController*)newTabViewController;

@end

NS_ASSUME_NONNULL_END
