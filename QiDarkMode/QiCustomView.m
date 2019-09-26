//
//  QiCustomView.m
//  QiDarkMode
//
//  Created by wangyongwang on 2019/9/25.
//  Copyright © 2019 WYW. All rights reserved.
//

#import "QiCustomView.h"

@implementation QiCustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    NSString *setColorStr = @"QiShare DarkMode Set Color";

    NSMutableDictionary *textAttris = [NSMutableDictionary dictionary];
    textAttris[NSFontAttributeName] = [UIFont systemFontOfSize:20.0];
    
    [setColorStr drawInRect:CGRectMake(.0, .0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) * 0.5) withAttributes:textAttris];
    
    NSString *notSetColorStr = @"QiShare DarkMode Not Set Color";
    //需要设置明确的文字颜色 否则默认为黑色 在DarkMode下无法看到
        textAttris[NSForegroundColorAttributeName] = [UIColor labelColor];
    //    textAttris[NSForegroundColorAttributeName] = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
    //        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
    //            return [UIColor redColor];
    //        } else {
    //            return [UIColor blueColor];
    //        }
    //    }];
    [notSetColorStr drawInRect:CGRectMake(.0, CGRectGetHeight(self.bounds) * 0.5, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) * 0.5) withAttributes:textAttris];
    
    NSLog(@"%s", __FUNCTION__);
}


- (void)layoutSubviews {
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)tintColorDidChange {
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
    if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
        NSLog(@"1：%s", __FUNCTION__);
    }
}



@end
