//
//  AppDelegate.m
//  WeiboStart
//
//  Created by 龙建 蒋 on 16/3/10.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "AppDelegate.h"
#import "UIView+Extension.h"
#import "Masonry.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSThread sleepForTimeInterval:2.0];
    [_window makeKeyAndVisible];
    
    //白色背景View
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.window.mas_centerY);
        make.centerX.mas_equalTo(self.window.mas_centerX);
        make.size.mas_equalTo(self.window.bounds.size);
    }];
    //头像View
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"icon"];
    iconView.size = iconView.image.size;
    [bgView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(bgView.mas_centerX);
        make.centerY.mas_equalTo(bgView.mas_centerY).offset(-75);
        //        make.size.mas_equalTo(iconView.image.size);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(70);
    }];
    //文字label
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textColor = [UIColor orangeColor];
    textLabel.text = @"欢迎回来";
    [bgView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(iconView.mas_centerX);
        make.centerY.mas_equalTo(iconView.mas_centerY).offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(35);
    }];
    textLabel.hidden = YES;
    //添加动画
    [UIView animateWithDuration:2.0 animations:^{
        iconView.layer.transform = CATransform3DMakeTranslation(0, -20, 0);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            textLabel.hidden = NO;
        });
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [bgView removeFromSuperview];
        });
    }];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
