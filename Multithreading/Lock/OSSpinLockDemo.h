//
//  OSSpinLockDemo.h
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//
/*
 OSSpinLock叫做”自旋锁”，等待锁的线程会处于忙等（busy-wait）状态，一直占用着CPU资源
 目前已经不再安全，可能会出现优先级反转问题
 如果等待锁的线程优先级较高，它会一直占用着CPU资源，优先级低的线程就无法释放锁
 需要导入头文件#import <libkern/OSAtomic.h>
 */

#import "BaseMultithread.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSSpinLockDemo : BaseMultithread

@end

NS_ASSUME_NONNULL_END
