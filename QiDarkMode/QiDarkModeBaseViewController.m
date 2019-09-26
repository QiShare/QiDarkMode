//
//  QiDarkModeBaseViewController.m
//  DarkMode
//
//  Created by WYW on 2019/9/9.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiDarkModeBaseViewController.h"

@interface QiDarkModeBaseViewController ()

@end

@implementation QiDarkModeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDarkModeUI];
}

- (void)initDarkModeUI {
    
    // Dark Mode Color
   if (@available(iOS 13.0, *)) {
       self.view.backgroundColor = [UIColor systemBackgroundColor];
       
       // 等价于
       // 可以在Dark 和 Light 模式下设置所需的颜色 如Dark下某个接近黑色的颜色 Light下某个接近白色的颜色
       /*
       self.view.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
           if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
               return [UIColor whiteColor];
           } else if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
               return [UIColor blackColor];
           }
           return [UIColor whiteColor];
       }];
        */
   }
}

- (UIImage *)qi_imageWithNamed:(NSString *)imageName {
    
    NSString *imgName = [NSString stringWithFormat:@"QiDarkModeResource.bundle/%@", imageName];
    
    return [UIImage imageNamed:imgName];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

@end
