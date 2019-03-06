# PluginApp

This is an example project that demonstrates the use of plugin frameworks within iOS applications.

This app assumes that multiple tabs in an application will be built and maintained by different teams. To support a flexible development model, the functionality for each tab is encapsulated in its own framework. The plugins are loaded at runtime and combined into a single tabbed app.

## Frameworks

This project has multiple frameworks, each with its own particular role.

### PluginProvider

This framework is a very simple framework that defines the protocol used by plugins that are capable of exposing their capabilities.  It also contains a singleton that provides access to load and iterate through the available plugins.

### MainTab

This Objective-C framework contains a storyboard and class that exposes the storyboard's view controller as a tab. You'll notice that it contains its own Media.xcassets bundle, meaning image resources are encapsulated within the framework. The main class MainTabProvider conforms to the plugin's protocol, and is defined in the Info.plist as the `NSPrincipalClass`.


### AccountTab

This Swift framework also contains a storyboard, plugin provider, and media assets bundle. Since this is a Swift framework, you'll notice that the Info.plist contains the class `AccountTab.AccountTabProvider` as the `NSPrincipalClass`.

## Suggestions for future improvement

Multiple plugin protocols can be used within the same class, potentially exposing the ability to embed settings into a particular screen, add listeners to bind to events, or to add omnipresent buttons to navigation bars.
