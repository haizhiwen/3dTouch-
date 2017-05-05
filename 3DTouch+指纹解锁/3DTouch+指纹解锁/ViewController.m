//
//  ViewController.m
//  3DTouch+指纹解锁
//
//  Created by 王亚军 on 2017/5/5.
//  Copyright © 2017年 王亚军. All rights reserved.
//

#import "ViewController.h"
#import "unLock.h"
#import "GifView.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"美女" ofType:@"gif"];
    ///gif
    [self creatImageView:path];
    
    
    ///指纹解锁
    unLock * lock = [unLock sharedUnlock];
    __weak typeof(self) weakSelf = self;
    lock.touchBlock = ^BOOL(BOOL success, NSError *error) {
        [weakSelf handleTouchWithResult:success Error:error];
        return YES;
    };
    
    [lock userFigerprintAuthenticationTipsStr:@"请把输入指纹的手指放在Home键上"];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)handleTouchWithResult:(BOOL)success Error:(NSError *)error{
    if (success) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"指纹验证通过！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
}

// gif
-(void)creatImageView:(NSString * )url
{
    GifView * gifView =[[GifView alloc]initWithFrame:CGRectMake(50, 100, 200, 200) filePath:url];
    
    gifView.backgroundColor =[UIColor cyanColor];
    
    gifView.contentMode =UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:gifView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
