//
//  unLock.h
//  3DTouch+指纹解锁
//
//  Created by 王亚军 on 2017/5/5.
//  Copyright © 2017年 王亚军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface unLock : NSObject

+ (unLock *)sharedUnlock;

- (void)userFigerprintAuthenticationTipsStr:(NSString*)tipsStr;

@property (nonatomic, copy) BOOL (^touchBlock)(BOOL success,NSError * error);

@end
