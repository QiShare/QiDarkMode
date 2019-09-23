//
//  QiDarkModeBaseViewController.h
//  DarkMode
//
//  Created by WYW on 2019/9/9.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import <UIKit/UIKit.h>
#define QiAvailable(version) @available(iOS version, *)

NS_ASSUME_NONNULL_BEGIN

@interface QiDarkModeBaseViewController : UIViewController

- (UIImage *)qi_imageWithNamed:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
