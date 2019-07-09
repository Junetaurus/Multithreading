//
//  SynchronizedDemo.h
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//
/*
 @synchronized是对mutex递归锁的封装
 源码查看：objc4中的objc-sync.mm文件
 @synchronized(obj)内部会生成obj对应的递归锁，然后进行加锁、解锁操作
 */

#import "BaseMultithread.h"

NS_ASSUME_NONNULL_BEGIN

@interface SynchronizedDemo : BaseMultithread

@end

NS_ASSUME_NONNULL_END
