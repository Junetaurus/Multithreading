//
//  PthreadMutexDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "PthreadMutexDemo.h"
#import <pthread.h>

@implementation PthreadMutexDemo {
    pthread_mutex_t _mutex;
    pthread_cond_t _cond;
    NSMutableArray *_objcArray;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //初始化锁的属性
        pthread_mutexattr_t mutexattr;
        pthread_mutexattr_init(&mutexattr);
        /*
         #define PTHREAD_MUTEX_NORMAL        0                      互斥锁
         #define PTHREAD_MUTEX_RECURSIVE        2                   递归锁
         */
        pthread_mutexattr_settype(&mutexattr, PTHREAD_MUTEX_NORMAL);
        //初始化条件
        pthread_cond_init(&_cond, NULL);
        //初始化锁
        pthread_mutex_init(&_mutex, &mutexattr);
        //销毁
        pthread_mutexattr_destroy(&mutexattr);
        pthread_cond_destroy(&_cond);
    }
    return self;
}

- (void)__sellTicket {
    pthread_mutex_lock(&_mutex);
    [super __sellTicket];
    pthread_mutex_unlock(&_mutex);
}

- (void)otherTest {
    _objcArray = [NSMutableArray array];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__addObjc) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__removeObjc) object:nil] start];
}

- (void)__addObjc {
    pthread_mutex_lock(&_mutex);
    NSLog(@"等待添加元素");
    sleep(0.5);
    NSLog(@"开始添加元素");
    [_objcArray addObject:@""];
    NSLog(@"添加元素成功");
    //激活一个
    pthread_cond_signal(&_cond);
    //激活所有的
//    pthread_cond_broadcast(&_cond);
    pthread_mutex_unlock(&_mutex);
}

- (void)__removeObjc {
    pthread_mutex_lock(&_mutex);
    NSLog(@"等待删除元素");
    if (!_objcArray.count) {
        NSLog(@"没有元素，等待添加元素");
        pthread_cond_wait(&_cond, &_mutex);
    }
    [_objcArray removeLastObject];
    NSLog(@"删除元素成功");
    pthread_mutex_unlock(&_mutex);
}

- (void)dealloc {
     pthread_mutex_destroy(&_mutex);
}

@end
