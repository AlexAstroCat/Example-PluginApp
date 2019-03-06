//
//  AccountTabProvider.swift
//  AccountTab
//
//  Created by Michael Nachbaur on 2019-03-05.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

import UIKit
import PluginProvider

class AccountTabProvider: NSObject, TabProvider {
    static func newTabViewController() -> UIViewController? {
        return UIStoryboard(name: "Storyboard", bundle: Bundle(for: self)).instantiateInitialViewController()
    }
}
