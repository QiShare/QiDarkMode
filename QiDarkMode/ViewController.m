//
//  ViewController.m
//  QiDarkMode
//
//  Created by wangyongwang on 2019/9/15.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 13.0, *)) {
        UIColor *forgroundColor = [UIColor colorNamed:@"colorName"];
        if (forgroundColor) {
            NSAttributedString *attriString = [[NSAttributedString alloc] initWithString:@"QiShare" attributes:@{NSForegroundColorAttributeName: forgroundColor}];
            NSLog(@"属性字符串%@", attriString);
        }
    }
    // UIActivityIndicatorView *indicatorView;
}


@end
