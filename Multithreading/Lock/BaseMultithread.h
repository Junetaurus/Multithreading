//
//  BaseMultithread.h
//  Multithreading
//
//  Created by Zhang on 2019/7/8.
//  Copyright © 2019 cue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseMultithread : NSObject

- (void)ticketTest;

- (void)otherTest;

/**-------暴露子类重写-------**/
- (void)__sellTicket;

@end

NS_ASSUME_NONNULL_END
