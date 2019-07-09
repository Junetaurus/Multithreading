//
//  ViewController.m
//  Multithreading
//
//  Created by Zhang on 2019/7/8.
//  Copyright © 2019 cue. All rights reserved.
//

#import "ViewController.h"
#import "BaseMultithread.h"

#import "OSSpinLockDemo.h"
#import "OSUnfairLockDemo.h"
#import "PthreadMutexDemo.h"
#import "NSLockDemo.h"
#import "NSRecursiveLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "DispatchSemaphoreDemo.h"
#import "DispatchQueueDemo.h"
#import "SynchronizedDemo.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *lockArray;
@property (nonatomic, strong) BaseMultithread *multithread;

@end

@implementation ViewController

- (NSArray *)lockArray {
    if (!_lockArray) {
        _lockArray = @[@"不使用线程同步", @"OSSpinLock", @"os_unfair_lock", @"NSLock", @"NSRecursiveLock", @"NSCondition", @"NSConditionLock", @"dispatch_semaphore", @"dispatch_queue", @"@synchronized"];
    }
    return _lockArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lockArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.textLabel.text = self.lockArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
        {
            _multithread = [[BaseMultithread alloc] init];
            [_multithread ticketTest];
        }
            break;
        case 1:
        {
            _multithread = [[OSSpinLockDemo alloc] init];
            [_multithread ticketTest];
        }
            break;
        case 2:
        {
            _multithread = [[PthreadMutexDemo alloc] init];
            [_multithread ticketTest];
//            [_multithread otherTest];
        }
            break;
        case 3:
        {
            _multithread = [[NSLockDemo alloc] init];
            [_multithread ticketTest];
        }
            break;
        case 4:
        {
            _multithread = [[NSRecursiveLockDemo alloc] init];
            [_multithread ticketTest];
//            [_multithread otherTest];
        }
            break;
        case 5:
        {
            _multithread = [[NSConditionDemo alloc] init];
            [_multithread ticketTest];
//            [_multithread otherTest];
        }
            break;
        case 6:
        {
            _multithread = [[NSConditionLockDemo alloc] init];
            [_multithread ticketTest];
//            [_multithread otherTest];
        }
            break;
        case 7:
        {
            _multithread = [[DispatchSemaphoreDemo alloc] init];
            [_multithread ticketTest];
//            [_multithread otherTest];
        }
            break;
        case 8:
        {
            _multithread = [[DispatchQueueDemo alloc] init];
            [_multithread ticketTest];
        }
            break;
        case 9:
        {
            _multithread = [[SynchronizedDemo alloc] init];
            [_multithread ticketTest];
        }
            break;
        default:
            break;
    }
}



@end
