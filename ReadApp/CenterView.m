//
//  CenterView.m
//  ReadApp
//
//  Created by xyooyy on 14/10/25.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "CenterView.h"

@implementation CenterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(NSArray*)bookImage
{
    NSArray *bookimage = [[NSArray alloc]initWithObjects:@"深入理解计算机系统s.png", @"Structure and Interpretation of Computer Programs - 2nd Edition (MIT) 2S.png", @"Hackers and Painters 3S.png", @"计算机网络4S.png", @"Computer Systems5S.png", @"Computer Architecture6S.png", @"Concepts, Techniques, and Models of Computer Programming7S.png", @"计算机程序的构造和解释8S.png", @"计算机程序设计艺术（第1卷）9S.png", @"算法导论10S.png", @"Computer Networking11S.png", @"The Computer Music Tutorial12S.png", @"Introduction to Algorithms13S.png", @"ACM图灵奖演讲集14S.png", @"Compilers15S.png", @"通灵芯片16S.png", @"算法设计与分析基础17S.png", @"现代操作系统18S.png", @"Computer Networking19S.png", @"ACM图灵奖20S.png", nil];
    return bookimage;
}
-(NSArray *)bookName
{
    NSArray *bookmenu = [[NSArray alloc]initWithObjects:@"深入理解计算机系统",@"Structure and Interpretation of Computer Programs - 2nd Edition (MIT)",@"Hackers and Painters",@"计算机网络",@"Computer Systems",@"Computer Architecture",@"Concepts, Techniques, and Models of Computer Programming",@"计算机程序的构造和解释",@"计算机程序设计艺术（第1卷）",@"算法导论",@"Computer Networking",@"The Computer Music Tutorial",@"Introduction to Algorithms",@"ACM图灵奖演讲集",@"Compilers",@"通灵芯片",@"算法设计与分析基础",@"现代操作系统",@"Computer Networking",@"ACM图灵奖", nil];
    return bookmenu;
}
-(NSArray*)bookAuthor
{
    NSArray *bookAuthor = [[NSArray alloc]initWithObjects:@"Randal E.Bryant \n David O'Hallaron", @"Harold Abelson \n Gerald Jay Sussman", @"Paul Graham",@"Andrew S. Tanenbaum",@"Randal E. Bryant \n David R. O'Hallaron", @"John L. Hennessy \n David A. Patterson",@"Peter Van Roy, Seif Haridi", @"Harold Abelson \n Gerald Jay Sussman \n Julie Sussman",@"[美] Donald E. Knuth", @"[美] Thomas H.Cormen \n Charles E.Leiserson \n Charles E.Leiserson \n Clifford Stein", @"James F. Kurose \n Keith W. Ross", @"Curtis Roads", @"Thomas H. Cormen \n Charles E. Leiserson \n Ronald L. Rivest \n Clifford Stein", @"阿申豪斯特", @"Alfred V. Aho \n Monica S. Lam \n Ravi Sethi \n Jeffrey D. Ullman", @"丹尼尔·希利斯", @"（美）莱维丁（Levitin/A.）/潘彦", @"Andrew S. Tanenbaum", @"James F. Kurose \n Keith W. Ross", @""
                           , nil];
    return bookAuthor;
}
-(NSArray *)bookPrice
{
    NSArray *bookPrice = [[NSArray alloc]initWithObjects:@"85.00元", @"USD 145.56", @"$22.95", @"60.00元", @"149.00美元", @"USD 89.95", @"USD 78.00", @"45.00元", @"80.00元", @"85.00元", @"USD 144.60", @"USD 75.00", @"85.00美元", @"55.0", @"USD 106.00", @"19.80元", @"45.0", @"75.00元", @"USD 155.20", @"20.5", nil];
    return bookPrice;
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
