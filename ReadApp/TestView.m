//
//  TestView.m
//  ReadApp
//
//  Created by xyooyy on 14/11/9.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)show :(id)target action:(SEL)press labelview:(UIView *)labelview buttonview:(UIView *)buttonview
{
    [self creatlabel:[UIColor colorWithRed:78.0/255.0 green:156.0/255.0 blue:156.0/255.0 alpha:1.0] :CGRectMake(0, 0, 320, 60) :@"test" :[UIColor blackColor] :labelview];
    UIButton *returnbutton = [self creatbutton:[UIColor colorWithRed:78.0/255.0 green:156.0/255.0 blue:156.0/255.0 alpha:1.0] :CGRectMake(10, 40, 50, 20) :@"返回" ];
    [returnbutton addTarget:target action:press forControlEvents:UIControlEventTouchUpInside];
    [buttonview addSubview:returnbutton];
}

-(UIButton *)creatbutton :(id)color :(CGRect)buttonframe :(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = color;
    button.frame =buttonframe;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    return button;
}
-(UILabel *)creatlabel :(id)color :(CGRect)frame :(NSString *)title :(id)textcolor :(UIView*)view
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.backgroundColor = color;
    label.textColor =textcolor;
    label.font = [UIFont systemFontOfSize:20];
    label.textAlignment = UITextAlignmentCenter;
    [view addSubview:label];
    return label;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
