//
//  CustomAlertView.m
//  customAlertView
//
//  Created by huchunyuan on 15/12/2.
//  Copyright © 2015年 huchunyuan. All rights reserved.
//

#import "CustomAlertView.h"

/** 二进制码转RGB */
#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation CustomAlertView
/** 单例 */
+ (CustomAlertView *)singleClass{
    static CustomAlertView *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CustomAlertView alloc] init];
    });
    return manager;
}
/** 提示view */
- (UIView *)quickAlertViewWithArray:(NSArray *)array{
    CGFloat buttonH = 61;
    CGFloat buttonW = 250;

    // 通过数组长度创建view的高
    UIView *alert = [[UIView alloc] initWithFrame:CGRectMake(0, 0,buttonW, array.count * buttonH)];
    for (int i = 0; i < array.count;i++) {
        // 因为有一条分割线 所以最下面是一层view
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, i*buttonH, buttonW, buttonH)];
        view.backgroundColor = [UIColor whiteColor];
        
        // 创建button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 0, buttonW, buttonH);
        [button setTitle:array[i] forState:(UIControlStateNormal)];
        // 所有button都关联一个点击方法,通过按钮上的title做区分
        [button addTarget:self action:@selector(alertAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [view addSubview:button];
        
        // 这里可以根据传值改变状态
        if ([array[i] isEqualToString:@"取消"]) {
            button.tintColor = [UIColor whiteColor];
            // 绿色背景
            view.backgroundColor = UIColorFromRGBValue(0x82DFB0);
        }else{
            button.tintColor = UIColorFromRGBValue(0x333333);
            // 分割线
            // 如果不是最后一行
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, buttonW, 1)];
            lineView.backgroundColor = UIColorFromRGBValue(0xefefef);
            [view addSubview:lineView];
        }
        [alert addSubview:view];
    }
    return alert;
}
/** button点击事件,通知代理执行代理方法 */
- (void)alertAction:(UIButton *)button{
    [_delegate didSelectAlertButton:button.titleLabel.text];
}
@end
