//
//  ViewController.m
//  RespringTool
//
//  Created by ruich97 on 26/1/13.
//  Copyright © 2026年 ruich97. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = self.view.bounds.size.width;
    
    // ===== Respring 按钮 =====
    UIButton *respringButton = [UIButton buttonWithType:UIButtonTypeSystem];
    respringButton.frame = CGRectMake(40, 120, width - 80, 44);
    [respringButton setTitle:@"注销SpringBoard" forState:UIControlStateNormal];
    [respringButton addTarget:self
                       action:@selector(respringButtonTapped)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:respringButton];
    
    // ===== Safe Mode 按钮 =====
    UIButton *safeModeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    safeModeButton.frame = CGRectMake(40, 180, width - 80, 44);
    [safeModeButton setTitle:@"尝试进入SafeMode(只按一次)" forState:UIControlStateNormal];
    [safeModeButton addTarget:self
                       action:@selector(safeModeButtonTapped)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:safeModeButton];
}

#pragma mark - Button Actions

// 重启 SpringBoard
- (void)respringButtonTapped {
    system("killall SpringBoard");
}

// 触发 Safe Mode（SIGABRT）
- (void)safeModeButtonTapped {
    // 尝试触发 Safe Mode
    system("killall -ABRT SpringBoard");
    
    // 如果 5 秒后还能执行到这里，说明没进 Safe Mode
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC),
                   dispatch_get_main_queue(), ^{
                       [self showSafeModeFailedAlert];
                   });
}

#pragma mark - Alert

// Safe Mode 失败提示（iOS 6 兼容）
- (void)showSafeModeFailedAlert {
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"进入SafeMode..."
                               message:@"请返回到桌面"
                              delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
    [alert show];
}

@end