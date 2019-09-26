//
//  QiDarkModeMaterialViewController.m
//  DarkMode
//
//  Created by WYW on 2019/9/9.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiDarkModeMaterialViewController.h"
#import "QiCustomView.h"

@interface QiDarkModeMaterialViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView2;
@property (nonatomic, strong) UILabel *attriLabel;
@property (nonatomic, strong) CALayer *colorLayer;
@property (nonatomic, strong) CALayer *normalColorLayer;

@end

@implementation QiDarkModeMaterialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"DarkModeMaterial";
    
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self.indicatorView startAnimating];
//    [self.indicatorView2 startAnimating];
}

- (void)setupUI {
    
    // UIActivityIndicatorView
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    // UIActivityIndicatorViewStyleLarge
    // UIActivityIndicatorViewStyleMedium
    // UIActivityIndicatorViewStyleGray
    // UIActivityIndicatorViewStyleLarge
    // UIActivityIndicatorViewStyleWhite
    // indicatorView.color = [UIColor systemIndigoColor];
    [indicatorView startAnimating];
    indicatorView.center = self.view.center;
    [self.view addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    // UIActivityIndicatorViewStyleWhiteLarge 在iOS13 中不适合直接单独使用
    UIActivityIndicatorView *indicatorView2 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [indicatorView2 startAnimating];
    indicatorView2.center = self.view.center;
    indicatorView2.frame = CGRectMake(CGRectGetMaxX(indicatorView.frame), CGRectGetMinY(indicatorView2.frame), CGRectGetWidth(indicatorView2.frame), CGRectGetHeight(indicatorView2.frame));
    [self.view addSubview:indicatorView2];
    self.indicatorView2 = indicatorView2;
    
    // UIActivityIndicatorViewStyleWhiteLarge 在iOS13 中不适合直接单独使用
    UIActivityIndicatorView *indicatorView3 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView3 startAnimating];
    indicatorView3.frame = CGRectMake(CGRectGetMinX(indicatorView.frame) - CGRectGetWidth(indicatorView3.frame), CGRectGetMinY(indicatorView2.frame), CGRectGetWidth(indicatorView3.frame), CGRectGetHeight(indicatorView3.frame));
    [self.view addSubview:indicatorView3];
    
    // UILabel 属性字符串 borderColor
    UILabel *attriLabel = [UILabel new];
    NSMutableParagraphStyle *mParaStyle = [[NSMutableParagraphStyle alloc] init];
    mParaStyle.alignment = NSTextAlignmentCenter;
    
    attriLabel.attributedText = [[NSAttributedString alloc] initWithString:@"BorderColor显示正常Label属性字符串" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],
                                                                                    NSForegroundColorAttributeName: [UIColor labelColor],
                                                                                                 NSParagraphStyleAttributeName: [mParaStyle copy]
    }];
    
    attriLabel.layer.borderWidth = 2.0;
    attriLabel.numberOfLines = 0;
    attriLabel.frame = CGRectMake(20.0, 100.0, 300.0, 50.0);
    
    /*
    attriLabel.layer.borderColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor systemRedColor];
        } else {
            return [UIColor blueColor];
        }
    }].CGColor;
    
    attriLabel.layer.borderColor = [[UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor systemRedColor];
        } else {
            return [UIColor blueColor];
        }
    }] resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    attriLabel.layer.borderColor = [UIColor systemBackgroundColor].CGColor;
     */
    // 上述设置attriLabel.layer.borderColor的方式均不能在亮暗模式切换的时候正常响应
    // 需结合traitCollectionDidChange再次设置attriLabel.layer.borderColor颜色
    // attriLabel.layer.borderColor = [[UIColor systemBackgroundColor] resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    [self.view addSubview:attriLabel];
    self.attriLabel = attriLabel;
    
    // UILabel 属性字符串 borderColor
    UILabel *attriLabel2 = [UILabel new];
    attriLabel2.attributedText = [[NSAttributedString alloc] initWithString:@"BorderColor显示异常Label" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0],
                                                                                    NSForegroundColorAttributeName: [UIColor labelColor],
                                                                                                 NSParagraphStyleAttributeName: [mParaStyle copy]
    }];
    attriLabel2.layer.borderWidth = 2.0;
    attriLabel2.numberOfLines = 0;
    attriLabel2.layer.borderColor = [[UIColor labelColor] resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    // attriLabel2.frame = CGRectMake(20.0, 170.0, 300.0, 50.0);
    attriLabel2.frame = CGRectMake(CGRectGetMinX(attriLabel.frame), CGRectGetMaxY(attriLabel.frame) + 20.0, CGRectGetWidth(attriLabel.frame), CGRectGetHeight(attriLabel.frame));
    [self.view addSubview:attriLabel2];
    
    UIButton *changeBGBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(indicatorView.frame) - 100.0, CGRectGetMaxY(indicatorView3.frame) + 20.0, 200.0, 40.0)];
    [changeBGBtn setTitle:@"改变视图背景色" forState:UIControlStateNormal];
    changeBGBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [changeBGBtn setTitleColor:[UIColor linkColor] forState:UIControlStateNormal];
    [changeBGBtn addTarget:self action:@selector(changeBGButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeBGBtn];
    
    // CustomView
    QiCustomView *customView = [QiCustomView new];
    customView.layer.borderWidth = 2.0;
    customView.layer.borderColor = [UIColor systemPurpleColor].CGColor;
    customView.backgroundColor = [UIColor systemBackgroundColor];
    customView.frame = CGRectMake(.0, CGRectGetMaxY(changeBGBtn.frame), CGRectGetWidth(self.view.frame), 100.0);
    [self.view addSubview:customView];
    
    _colorLayer = [CALayer layer];
    _colorLayer.frame = CGRectMake(20.0, CGRectGetMaxY(customView.frame) + 20.0, 200.0, 40.0);
    [self.view.layer addSublayer:_colorLayer];
    // _colorLayer.backgroundColor = [[UIColor systemBackgroundColor] resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    _colorLayer.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor redColor];
        } else {
            return [UIColor blueColor];
        }
    }].CGColor;
    
    _colorLayer.borderWidth = 5.0;
    _colorLayer.borderColor = [[UIColor systemBackgroundColor] resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    // CALayer的borderColor backgroundColor 显示上均有问题
    // 可以考虑得到通知后设置一下颜色 查看效果
    
    _normalColorLayer = [CALayer layer];
    _normalColorLayer.frame = CGRectMake(20.0, CGRectGetMaxY(_colorLayer.frame) + 20.0, 200.0, 40.0);
    [self.view.layer addSublayer:_normalColorLayer];
    _normalColorLayer.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor redColor];
        } else {
            return [UIColor blueColor];
        }
    }].CGColor;
    
    _normalColorLayer.borderWidth = 5.0;
    _normalColorLayer.borderColor = [[UIColor systemBackgroundColor] resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    
    [self.traitCollection performAsCurrentTraitCollection:^{
        // TODO: performAsCurrentTraitCollection
    }];
}


#pragma mark - Actions

- (void)changeBGButtonClicked:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    self.view.backgroundColor = sender.selected ? [UIColor systemTealColor] : [UIColor systemBackgroundColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self.indicatorView stopAnimating];
//    [self.indicatorView2 stopAnimating];
}


#pragma mark - Overrides

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
    if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
        self.attriLabel.layer.borderColor = [UIColor systemBackgroundColor].CGColor;
        self.normalColorLayer.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor redColor];
            } else {
                return [UIColor blueColor];
            }
        }].CGColor;
        self.normalColorLayer.borderColor = [UIColor systemBackgroundColor].CGColor;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

/*
// 整个控制器中的界面都使用暗模式
- (UIUserInterfaceStyle)overrideUserInterfaceStyle {

    return UIUserInterfaceStyleDark;
}
 */

@end
