//
//  LeftView.m
//  ReadApp
//
//  Created by xyooyy on 14/10/23.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "LeftView.h"

@implementation LeftView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void) bookName:(UITableView *)tableView :(NSArray*)bookmenu
{
    
    tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    bookmenu = [[NSArray alloc]initWithObjects:@"深入理解计算机系统",@"Structure and Interpretation of Computer Programs - 2nd Edition (MIT)",@"Hackers and Painters",@"计算机网络",@"Computer Systems",@"Computer Architecture",@"Concepts, Techniques, and Models of Computer Programming",@"计算机程序的构造和解释",@"计算机程序设计艺术（第1卷）",@"算法导论",@"Computer Networking",@"The Computer Music Tutorial",@"Introduction to Algorithms",@"ACM图灵奖演讲集",@"Compilers",@"通灵芯片",@"算法设计与分析基础",@"现代操作系统",@"Computer Networking",@"ACM图灵奖", nil];
    [self addSubview:tableView];
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
