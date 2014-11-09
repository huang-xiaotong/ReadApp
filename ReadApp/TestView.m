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
-(UIButton *)creatbutton :(id)color :(CGRect)buttonframe :(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = color;
    button.frame =buttonframe;
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}
-(UILabel *)creatlabel :(id)color :(CGRect)frame :(NSString *)title :(id)textcolor :(UIView*)view
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.backgroundColor = color;
    label.textColor =textcolor;
    label.font = [UIFont systemFontOfSize:16];
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
