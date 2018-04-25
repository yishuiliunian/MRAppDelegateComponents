# MRAppDelegateComponents

[![CI Status](https://img.shields.io/travis/yishuiliunian@gmail.com/MRAppDelegateComponents.svg?style=flat)](https://travis-ci.org/yishuiliunian@gmail.com/MRAppDelegateComponents)
[![Version](https://img.shields.io/cocoapods/v/MRAppDelegateComponents.svg?style=flat)](https://cocoapods.org/pods/MRAppDelegateComponents)
[![License](https://img.shields.io/cocoapods/l/MRAppDelegateComponents.svg?style=flat)](https://cocoapods.org/pods/MRAppDelegateComponents)
[![Platform](https://img.shields.io/cocoapods/p/MRAppDelegateComponents.svg?style=flat)](https://cocoapods.org/pods/MRAppDelegateComponents)


> AppDelegate 组件化拆分基础框架，可以让您将AppDelegate多个复杂的回调拆解到不同的模块中。


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

1. MRLoginInjection (实例逻辑注入框架)

## Installation

MRAppDelegateComponents is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MRAppDelegateComponents'
```

## Usage

将需要拆分的逻辑单独拆成类，然后让该类实现协议 `MRApplicationDelegateInjectionProtocol`  即可。同事需要注意判断父类是否实现了对应方法，如果实现了则需要调用他。

~~~
#import <MRAppDelegateComponents/MRAppDelegateComponents.h>
@interface MRAppDelegateLogic1 () <UIApplicationDelegate, MRApplicationDelegateInjectionProtocol>

@end
@implementation MRAppDelegateLogic1
- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SEL sel = @selector(application:didFinishLaunchingWithOptions:);
    if (__MRSuperImplatationCurrentCMD__(sel)) {
        MRPrepareSendSuper(BOOL, id, id);
        MRSendSuperSelector(sel, application, launchOptions);
    }
    NSLog(@"MRAppDelegateLogic1 handle");
    return YES;
}
@end
~~~

## Author

yishuiliunian@gmail.com, stonedong@tencent.com

## License

MRAppDelegateComponents is available under the MIT license. See the LICENSE file for more info.
