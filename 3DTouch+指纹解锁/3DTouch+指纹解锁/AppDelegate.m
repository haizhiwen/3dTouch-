//
//  AppDelegate.m
//  3DTouch+指纹解锁
//
//  Created by 王亚军 on 2017/5/5.
//  Copyright © 2017年 王亚军. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#define ColorRGB(r, g, b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define COLOR_NavigationBar_1 ColorRGB(255, 139, 100)

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //菜单图标
    UIApplicationShortcutIcon *iconCamera = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    //菜单文字
    UIMutableApplicationShortcutItem *itemCamera = [[UIMutableApplicationShortcutItem alloc] initWithType:@"1" localizedTitle:@"拍照"];
    //绑定信息到指定菜单
    itemCamera.icon = iconCamera;
    //相册
    //菜单图标
    UIApplicationShortcutIcon *iconPhotoLibrary = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    //菜单文字
    UIMutableApplicationShortcutItem *itemPhotoLibrary = [[UIMutableApplicationShortcutItem alloc] initWithType:@"2" localizedTitle:@"相册"];
    //绑定信息到指定菜单
    itemPhotoLibrary.icon = iconPhotoLibrary;
    //绑定到App icon
    application.shortcutItems = @[itemCamera,itemPhotoLibrary];
    
    
    
    self.window =[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController* vc= [[ViewController alloc]init];
    UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:vc];
    
    [[UINavigationBar appearance] setBarTintColor:COLOR_NavigationBar_1];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
