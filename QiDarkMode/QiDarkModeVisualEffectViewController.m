//
//  QiDarkModeVisualEffectViewController.m
//  DarkMode
//
//  Created by WYW on 2019/9/9.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiDarkModeVisualEffectViewController.h"

@interface QiDarkModeVisualEffectViewController ()

@end

@implementation QiDarkModeVisualEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"DarkModeVisualEffectView";
    [self setupUI];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor systemTealColor];
    
    // 创建UIVisualEffectView
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterial];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = CGRectMake(.0, 100.0, CGRectGetWidth(self.view.frame), 150.0);
    [self.view addSubview:visualEffectView];
    
    // 创建UIVibrancyEffect
    UIVibrancyEffect *vibrancyEffect =
    [UIVibrancyEffect effectForBlurEffect:blurEffect style:UIVibrancyEffectStyleSecondaryLabel];
    UIVisualEffectView *vibrancyView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    [visualEffectView.contentView addSubview:vibrancyView];
    vibrancyView.frame = visualEffectView.bounds;
    vibrancyView.frame = CGRectMake(.0, .0, CGRectGetWidth(visualEffectView.frame), CGRectGetHeight(visualEffectView.frame) * 0.5);
    
    UILabel *label = [UILabel new];
    label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle compatibleWithTraitCollection:self.traitCollection];
    label.text = @"Vibrant Label1";
    [vibrancyView.contentView addSubview:label];
    label.frame = vibrancyView.bounds;
    
    UIBlurEffect *blurEffect2 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterial];
    UIVisualEffectView *visualEffectView2 = [[UIVisualEffectView alloc] initWithEffect:blurEffect2];
    visualEffectView2.frame = CGRectMake(.0, 300.0, CGRectGetWidth(self.view.frame), 150);
    [self.view addSubview:visualEffectView2];
    
    // 创建UIVisualEffectView
    UIVibrancyEffect *vibrancyEffect2 =
    [UIVibrancyEffect effectForBlurEffect:blurEffect2 style:UIVibrancyEffectStyleSecondaryLabel];
    UIVisualEffectView *vibrancyView2 = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect2];
    [visualEffectView2.contentView addSubview:vibrancyView2];
    vibrancyView2.frame = CGRectMake(.0, .0, CGRectGetWidth(visualEffectView2.frame), CGRectGetHeight(visualEffectView2.frame) * 0.5);
    
    UILabel *label2 = [UILabel new];
    label2.font = [UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle compatibleWithTraitCollection:self.traitCollection];
    label2.text = @"Vibrant Label2";
    [vibrancyView2.contentView addSubview:label2];
    label2.frame = vibrancyView2.bounds;
    
    UIBlurEffect *blurEffect3 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThickMaterial];
    UIVisualEffectView *visualEffectView3 = [[UIVisualEffectView alloc] initWithEffect:blurEffect3];
    [self.view addSubview:visualEffectView3];
    visualEffectView3.frame = CGRectMake(.0, 500.0, CGRectGetWidth(self.view.frame), 100.0);
    
    // 创建UIVisualEffectView
    UIVibrancyEffect *vibrancyEffect3 =
    [UIVibrancyEffect effectForBlurEffect:blurEffect2 style:UIVibrancyEffectStyleTertiaryLabel];
    UIVisualEffectView *vibrancyView3 = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect3];
    [visualEffectView3.contentView addSubview:vibrancyView3];
    vibrancyView3.frame = visualEffectView3.bounds;
    
    UILabel *label3 = [UILabel new];
    label3.font = [UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle compatibleWithTraitCollection:self.traitCollection];
    label3.text = @"Vibrant Label3";
    [vibrancyView3.contentView addSubview:label3];
    label3.frame = CGRectMake(.0, .0, CGRectGetWidth(vibrancyView3.frame), CGRectGetHeight(vibrancyView3.frame) * 0.5);
    
    UILabel *label4 = [UILabel new];
    // label4.font = [UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle compatibleWithTraitCollection:self.traitCollection];
    label4.text = @"Vibrant Label4";
    // label4.backgroundColor = [UIColor secondaryLabelColor];
    // label4.textColor = [UIColor labelColor];
    [visualEffectView3.contentView addSubview:label4];
    label4.frame = CGRectMake(.0, CGRectGetHeight(vibrancyView3.frame) * 0.5, CGRectGetWidth(vibrancyView3.frame), CGRectGetHeight(vibrancyView3.frame) * 0.5);
}

@end
