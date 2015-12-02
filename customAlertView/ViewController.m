//
//  ViewController.m
//  customAlertView
//
//  Created by huchunyuan on 15/12/2.
//  Copyright © 2015年 huchunyuan. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"

@interface ViewController ()<CustomAlertViewDelegate>
/** 提示框 */
@property (strong, nonatomic) UIView *alertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor lightGrayColor];
    // 将提示页面加入到view上
    [self.view addSubview:self.alertView];
}

// 这个是stroyBoard里创建的button
- (IBAction)alertAction:(UIButton *)sender {
    // UIView动画
    [UIView animateWithDuration:0.1 animations:^{
        self.alertView.alpha = 1;
        self.alertView.hidden = NO;
    }];
}

/** 提示框懒加载 */
- (UIView *)alertView{
    if (!_alertView) {
        // 这里还可以把alerView创建到一个蒙版上,直接进行操作蒙版的透明度隐藏来展示动画,也可以避免点击框外的其他控件,就不在这里细写了
        // 赋值
        _alertView = [[CustomAlertView singleClass]
                      // 传入数组
                      quickAlertViewWithArray:@[@"确定",@"测试A",@"测试B",@"取消"]
                      ];
        
        // 设定中心,如果需要适配请layoutIfNeed
        _alertView.center = self.view.center;
        // 切圆角
        _alertView.layer.masksToBounds = YES;
        _alertView.layer.cornerRadius = 10;
        // 初始状态为隐藏,透明度为0
        _alertView.hidden = YES;
        _alertView.alpha = 0.0;
        // 设置代理
        [CustomAlertView singleClass].delegate = self;
    }
    return _alertView;
}

// 代理方法传值
- (void)didSelectAlertButton:(NSString *)title{
    [UIView animateWithDuration:0.1 animations:^{
        self.alertView.alpha = 0;
    } completion:^(BOOL finished) {
        // 如果直接在动画里隐藏不会出现动画效果,所以要在动画结束之后进行隐藏
        self.alertView.hidden = YES;
    }];
    NSLog(@"%@",title);
}

@end
