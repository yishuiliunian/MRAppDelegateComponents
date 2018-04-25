//
//  MRApplicationDelegateInjectionProtocol.h
//  AOPKit
//
//  Created by Dong Zhao on 2017/12/19.
//

#import <Foundation/Foundation.h>


/**
 用于标记需要对AppDelegate进行Hook操作的类，如果您的一个类需要对AppDelegate进行Hook操作，则需要实现改协议。在对AppDeleagte进行Hook的时候，请使用MRLogicInjection机制。具体可以查看 MRLogicInjection 中的使用说明。并且注意，在Hook相关函数的时候一定要判断并调用其父类。
 */
@protocol MRApplicationDelegateInjectionProtocol <NSObject>

@end
