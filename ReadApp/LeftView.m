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
-(void) bookName
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
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
