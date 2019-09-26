//
//  QiDarkModeColorViewController.m
//  DarkMode
//
//  Created by WYW on 2019/9/9.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiDarkModeColorViewController.h"
#import "QiPresentationController.h"
#import "QiDarkModeImageViewController.h"

@implementation QiDarkModeColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewWillLayoutSubviews {
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLayoutSubviews {
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)setupUI {
    
    self.tabBarItem.title = @"Color";
    self.navigationItem.title = @"DarkModeColor";
    
    UITextField *textField = [UITextField new];
    textField.backgroundColor = [UIColor secondaryLabelColor];
    [self.view addSubview:textField];
    textField.frame = CGRectMake(20.0, 100.0, 300.0, 40.0);
    textField.placeholder = @"QiShare";
    textField.textColor = [UIColor placeholderTextColor];
    
    UILabel *label = [UILabel new];
    label.text = @"QiShare";
    label.backgroundColor = [UIColor tertiarySystemBackgroundColor];
    [label sizeToFit];
    [self.view addSubview:label];
    label.center = self.view.center;
    label.textColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
     if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
         return [UIColor lightTextColor];
     } else {
         return [UIColor darkTextColor];
     }
    }];
}

#pragma mark - Actions

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    QiDarkModeImageViewController *darkImgVC = [QiDarkModeImageViewController new];
    QiPresentationController *presentTationController = [[QiPresentationController alloc] initWithPresentedViewController:darkImgVC presentingViewController:self];
    darkImgVC.transitioningDelegate = presentTationController;
    [self presentViewController:darkImgVC animated:YES completion:nil];
}


#pragma mark - Override

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}


@end
