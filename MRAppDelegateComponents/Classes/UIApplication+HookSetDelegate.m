//
//  UIApplication+HookSetDelegate.m
//  AOPKit
//
//  Created by Dong Zhao on 2017/12/19.
//

#import "UIApplication+HookSetDelegate.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "MRApplicationDelegateInjectionProtocol.h"
#import <MRLogicInjection/MRLogicInjection.h>
#import <objc/runtime.h>
void MReSwizzingClassMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod)
    {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


NSArray* MRClassesConformToProtocol(Protocol* protocol) {
    NSMutableArray* modules = [NSMutableArray new];
    unsigned int outCount;
    Class *classes = objc_copyClassList(&outCount);
    for (int i = 0; i < outCount; i++) {
        Class cla = classes[i];
        if (cla && class_conformsToProtocol(cla, protocol)) {
            [modules addObject:cla];
        }
    }
    free(classes);
    return modules;
}


@implementation UIApplication (HookSetDelegate)

- (void)__MR_messaging_setDelegate:(id<UIApplicationDelegate>)delegate
{
    NSArray* logics = MRClassesConformToProtocol(@protocol(MRApplicationDelegateInjectionProtocol));
    MRExtendInstanceLogicWithKey(delegate, @"qil-yishui", logics);
    [self __MR_messaging_setDelegate:delegate];
}
@end

@interface MRApplicationDelegateHookLoader  : NSObject

@end
@implementation MRApplicationDelegateHookLoader
+ (void) load
{
    MReSwizzingClassMethod([UIApplication class], @selector(setDelegate:), @selector(__MR_messaging_setDelegate:));
}
@end


