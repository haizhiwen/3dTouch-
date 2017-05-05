//
//  unLock.m
//  3DTouch+指纹解锁
//
//  Created by 王亚军 on 2017/5/5.
//  Copyright © 2017年 王亚军. All rights reserved.
//

#import "unLock.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation unLock

+ (unLock *)sharedUnlock{
    static unLock *lock = nil;
    if (!lock) {
        lock = [[unLock alloc] init];
    }
    return lock;
}
- (void)userFigerprintAuthenticationTipsStr:(NSString*)tipsStr
{
    
    LAContext *context = [[LAContext alloc]init];
    NSError *err = nil;

    //判断设备是否支持指纹解锁
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&err])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:tipsStr reply:^(BOOL success, NSError * _Nullable error) {
            if (success)
            {
                
                NSLog(@"验证成功");
                if (self.touchBlock) {
                    self.touchBlock(success,error);
                }
                
            }else
            {
                if (self.touchBlock) {
                    self.touchBlock(success,error);
                }
                //验证失败的几种情况
                
                switch (error.code) {
                
                    case LAErrorAuthenticationFailed:
                        NSLog(@"LAErrorSystemCancel");
                        
                        break;
                    case LAErrorUserCancel://用户取消
                        NSLog(@"LAErrorUserCancel");
                        
                        break;
                    case LAErrorUserFallback://验证失败
                        NSLog(@"LAErrorUserFallback");
                        
                        break;
                    case LAErrorSystemCancel:
                        NSLog(@"LAErrorAppCancel");
                        
                        break;
                    case LAErrorPasscodeNotSet:
                        NSLog(@"LAErrorSystemCancel");
                        
                        break;
                    case LAErrorTouchIDNotAvailable:
                        NSLog(@"LAErrorUserCancel");
                        
                        break;
                    case LAErrorTouchIDNotEnrolled:
                        NSLog(@"LAErrorUserFallback");
                        
                        break;
                    case LAErrorTouchIDLockout:
                        NSLog(@"LAErrorAppCancel");
                        
                        break;
                    case LAErrorAppCancel:
                        NSLog(@"LAErrorAppCancel");
                        
                        break;
                    case LAErrorInvalidContext:
                        NSLog(@"LAErrorAppCancel");
                        
                        break;
                    default:
                        NSLog(@"%@",error.localizedDescription);
                        break;
                }
            }
            
        }];
        
    }
    else{
        if (self.touchBlock) {
            self.touchBlock(NO,err);
        }
        NSLog(@"不支持touch id");
    }
    
}

@end
