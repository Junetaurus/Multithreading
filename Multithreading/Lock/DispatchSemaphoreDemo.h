//
//  DispatchSemaphoreDemo.h
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//
/*
 semaphore叫做”信号量”
 信号量的初始值，可以用来控制线程并发访问的最大数量
 信号量的初始值为1，代表同时只允许1条线程访问资源，保证线程同步
 */

#import "BaseMultithread.h"

NS_ASSUME_NONNULL_BEGIN

@interface DispatchSemaphoreDemo : BaseMultithread

@end

NS_ASSUME_NONNULL_END
