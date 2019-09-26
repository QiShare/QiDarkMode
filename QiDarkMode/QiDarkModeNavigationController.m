//
//  QiDarkModeNavigationController.m
//  QiDarkMode
//
//  Created by wangyongwang on 2019/9/26.
//  Copyright © 2019 WYW. All rights reserved.
//

#import "QiDarkModeNavigationController.h"

@implementation QiDarkModeNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    
    return self.topViewController;
}

@end
