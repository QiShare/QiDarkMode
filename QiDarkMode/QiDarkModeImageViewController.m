//
//  QiDarkModeImageViewController.m
//  DarkMode
//
//  Created by WYW on 2019/9/9.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiDarkModeImageViewController.h"

@interface QiDarkModeImageViewController ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIImage *lightLogoImage;
@property (nonatomic, strong) UIImage *darkLogoImage;

@end

@implementation QiDarkModeImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    if (QiAvailable(13.0)) {
        if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                self.logoImageView.image =
                self.darkLogoImage;
            } else {
                self.logoImageView.image =
                self.lightLogoImage;
            }
        }
    }
}

- (void)setupUI {
    
    self.tabBarItem.title = @"Image";
    self.navigationItem.title = @"DarkModeImage";
    
    // Asset中设置多张图片
    UIImage *logoImage = [UIImage imageNamed:@"QiShare"];
    
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logoImage];
    logoImageView.frame = CGRectMake(120.0, 100.0, logoImage.size.width, logoImage.size.height);
    [self.view addSubview:logoImageView];
    
    // Bundle中的图片收到通知后去改变
    self.darkLogoImage = [self qi_imageWithNamed:@"flutterLogo"];
    self.lightLogoImage = [self qi_imageWithNamed:@"QiShare"];
    UIImage *logoImg =self.lightLogoImage;
    
    UIImageView *logoImgV = [[UIImageView alloc] initWithImage:logoImg];
    self.logoImageView = logoImgV;
    [self.view addSubview:logoImgV];
    logoImgV.frame = CGRectMake(120.0, 220.0, logoImg.size.width, logoImg.size.height);
    
    // tintColor 改变Image着色
    UIImage *starImage = [UIImage imageNamed:@"star"];
    // UIImageRenderingModeAlwaysTemplate：Always draw the image as a template image, ignoring its color information
    // 忽略图片的颜色信息 把图片作为模板图片来绘制
    // 图片的显示颜色由tintColor控制
    starImage = [starImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *starImageView = [[UIImageView alloc] initWithImage:starImage];
    starImageView.frame = CGRectMake(100.0, 320.0, starImage.size.width, starImage.size.height);
    starImageView.tintColor = [UIColor colorNamed:@"StarColor"];
    [self.view addSubview:starImageView];
}



@end
