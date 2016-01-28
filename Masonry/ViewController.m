//
//  ViewController.m
//  Masonry
//
//  Created by dc004 on 16/1/4.
//  Copyright © 2016年 gang. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test1];
    [self test2];
}
-(void)test1{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.8];
    [self.view addSubview:view];
    //添加限制，约束
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        //edges 边
        //insets 内边距
        //with 没有功能，只是为了可读性更强
        //方法1
//        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        //方法2
//        make.leftMargin.mas_equalTo(0);
//        make.rightMargin.mas_equalTo(0);
//        make.topMargin.mas_equalTo(18);
//        make.bottomMargin.mas_equalTo(-18);
    }];
}
-(void)test2{
    UIView *view1 = [[UIView alloc]init];
    UIView *view2 = [[UIView alloc]init];
    UIView *view3 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor brownColor];
    view2.backgroundColor = [UIColor purpleColor];
    view3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    //增加约束
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.view.mas_centerY);//让view1的y坐标的中点等于self.view的y坐标的中点
        make.width.mas_equalTo(view2.mas_width);//宽度等于view2的宽度
        make.left.mas_equalTo(self.view.mas_left).with.offset(10);//view1的左边距
        make.right.mas_equalTo(view2.mas_left).with.offset(-10);//view1的右边距，相对view2来设置
        make.top.mas_equalTo(self.view.mas_top).offset(10);
        make.bottom.mas_equalTo(view3.mas_top).offset(-10);
        
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
//        make.left.mas_equalTo(self.view.mas_left).with.offset(10);
//        make.top.mas_equalTo(self.view.mas_top).with.offset(10);
//        make.right.mas_equalTo(20);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(view1.mas_width);
        make.left.mas_equalTo(view1.mas_right).with.offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.top.mas_equalTo(self.view.mas_top).offset(10);
        make.bottom.mas_equalTo(view3.mas_top).offset(-10);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(view1.mas_height);
//        make.height.mas_equalTo(view2.mas_height);
        make.left.mas_equalTo(self.view.mas_left).with.offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.top.mas_equalTo(view1.mas_bottom).offset(10);
//        make.top.mas_equalTo(view2.mas_bottom).offset(-10);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-10);
    }];
    //控制视图出现时间
    [UIView animateWithDuration:3 animations:^{
        [self.view layoutIfNeeded];//告知页面布局立即更新
    }];
    NSLog(@"%@",NSStringFromCGRect(view1.frame));
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
