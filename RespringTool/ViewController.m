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
    
    UIButton *respringButton = [UIButton buttonWithType:UIButtonTypeSystem];
    respringButton.frame = CGRectMake(40, 120, width - 80, 44);
    [respringButton setTitle:@"注销SpringBoard" forState:UIControlStateNormal];
    [respringButton addTarget:self
                       action:@selector(respringButtonTapped)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:respringButton];
    
    UIButton *safeModeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    safeModeButton.frame = CGRectMake(40, 180, width - 80, 44);
    [safeModeButton setTitle:@"尝试进入SafeMode(只按一次)" forState:UIControlStateNormal];
    [safeModeButton addTarget:self
                       action:@selector(safeModeButtonTapped)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:safeModeButton];
}

#pragma mark - Button Actions

- (void)respringButtonTapped {
    system("killall SpringBoard");
}

- (void)safeModeButtonTapped {
    system("killall -ABRT SpringBoard");
    
    // 如果5秒后还能执行到这里，说明没进Safe Mode
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC),
                   dispatch_get_main_queue(), ^{
                       [self showSafeModeFailedAlert];
                   });
}

#pragma mark - Alert

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
