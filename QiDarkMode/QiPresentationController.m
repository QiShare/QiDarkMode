//
//  QiPresentationController.m
//  QiDarkMode
//
//  Created by wangyongwang on 2019/9/25.
//  Copyright © 2019 WYW. All rights reserved.
//

#import "QiPresentationController.h"

@interface QiPresentationController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation QiPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self) {
         // presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container {
    
    [super preferredContentSizeDidChangeForChildContentContainer:container];
    if (container == self.presentedViewController) {
        [self.containerView setNeedsLayout];
    }
}




- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
    if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
        NSLog(@"%s", __FUNCTION__);
    }
}

- (void)containerViewWillLayoutSubviews {
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)containerViewDidLayoutSubviews {
    
    NSLog(@"%s", __FUNCTION__);
}

- (void)presentationTransitionWillBegin {
    
    _dimmingView = [[UIView alloc] initWithFrame:self.containerView.bounds];
    [self.containerView addSubview:_dimmingView];
    _dimmingView.backgroundColor = [UIColor redColor];
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    
}

- (void)dismissalTransitionWillBegin {
    
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    
}

@end
