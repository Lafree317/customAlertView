//
//  CustomAlertView.h
//  customAlertView
//
//  Created by huchunyuan on 15/12/2.
//  Copyright © 2015年 huchunyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 代理方法
@protocol CustomAlertViewDelegate <NSObject>

// 可选执行方法
@optional
// 点击按钮下标时传递参数
- (void)didSelectAlertButton:(NSString *)title;
@end

@interface CustomAlertView : NSObject
/** 单例 */
+ (CustomAlertView *)singleClass;

/** 快速创建提示框*/
- (UIView *)quickAlertViewWithArray:(NSArray *)array;

// 代理属性
@property (assign, nonatomic)id<CustomAlertViewDelegate>delegate;

@end
