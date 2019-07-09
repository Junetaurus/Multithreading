//
//  PthreadMutexDemo.h
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//
/*
 mutex叫做”互斥锁”，等待锁的线程会处于休眠状态
 需要导入头文件#import <pthread.h>
 */

#import "BaseMultithread.h"

NS_ASSUME_NONNULL_BEGIN

@interface PthreadMutexDemo : BaseMultithread

@end

NS_ASSUME_NONNULL_END
