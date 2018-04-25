//
//  MRAppDelegateLogic2.m
//  MRAppDelegateComponents_Example
//
//  Created by Dong Zhao on 2018/4/25.
//  Copyright © 2018年 yishuiliunian@gmail.com. All rights reserved.
//

#import "MRAppDelegateLogic2.h"
#import <MRAppDelegateComponents/MRAppDelegateComponents.h>
@interface MRAppDelegateLogic2 () <UIApplicationDelegate, MRApplicationDelegateInjectionProtocol>

@end
@implementation MRAppDelegateLogic2
- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SEL sel = @selector(application:didFinishLaunchingWithOptions:);
    if (__MRSuperImplatationCurrentCMD__(sel)) {
        MRPrepareSendSuper(BOOL, id, id);
        MRSendSuperSelector(sel, application, launchOptions);
    }
    NSLog(@"MRAppDelegateLogic2 handle");
    return YES;
}
@end
