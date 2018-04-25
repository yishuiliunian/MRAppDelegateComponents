//
//  MRAppDelegateLogic1.m
//  MRAppDelegateComponents_Example
//
//  Created by Dong Zhao on 2018/4/25.
//  Copyright © 2018年 yishuiliunian@gmail.com. All rights reserved.
//

#import "MRAppDelegateLogic1.h"

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
