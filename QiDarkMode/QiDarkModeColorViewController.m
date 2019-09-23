//
//  QiDarkModeColorViewController.m
//  DarkMode
//
//  Created by WYW on 2019/9/9.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiDarkModeColorViewController.h"

@implementation QiDarkModeColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}


@end
