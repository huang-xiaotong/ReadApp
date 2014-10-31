//
//  EveryBook.m
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "EveryBook.h"

@implementation EveryBook

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(UIImageView *)creatImageView :(id)bookImage
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 105, 145)];
    UIImage *bookimage = [[UIImage alloc]init];
    bookimage = bookImage;
    imageView.image =bookimage;
    return imageView;
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
