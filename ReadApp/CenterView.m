//
//  CenterView.m
//  ReadApp
//
//  Created by xyooyy on 14/10/25.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "CenterView.h"

@implementation CenterView
//@synthesize listBookAuthor;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)getdataBookName
{
    NSError *error;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/book/search?tag=computer"]];
    
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    //获取数组list的内容
    NSArray *list = [dic objectForKey:@"books"];
    //初始化成员变量
    listBookName = [[NSMutableArray alloc]init];
    listbookPrice = [[NSMutableArray alloc]init];
    listBookSummary = [[NSMutableArray alloc]init];
    listBookAuthor = [[NSMutableArray alloc]init];
    //遍历数组list里的内容
    for (int i = 0; i<[list count]; i++) {
        //按数组中的索引取出对应的字典
        NSDictionary *listdicBook = [list objectAtIndex:i];
        //通过字典中的key取出对应value，并且强制转化为NSString类型
        NSString *bookName = (NSString *)[listdicBook objectForKey:@"title"];
        NSString *bookPrice = (NSString *)[listdicBook objectForKey:@"price"];
        NSString *bookSummary = (NSString *)[listdicBook objectForKey:@"summary"];
        NSArray *bookAuthor = [listdicBook objectForKey:@"author"];
        //将获取的value值放到数组容器中
        [listBookName addObject:bookName];
        [listbookPrice addObject:bookPrice];
        [listBookSummary addObject:bookSummary];
        [listBookAuthor addObject:bookAuthor];
    }
    listBookauthor = [[NSMutableArray alloc]init];
    for (int i = 0; i<[listBookAuthor count]; i++) {
        NSString *string = [listBookAuthor[i] componentsJoinedByString:@","];
        [listBookauthor addObject:string];
    }
}
-(NSArray*)bookImage
{
    NSArray *bookimage = [[NSArray alloc]initWithObjects:@"深入理解计算机系统s.png", @"Structure and Interpretation of Computer Programs - 2nd Edition (MIT) 2S.png", @"Hackers and Painters 3S.png", @"计算机网络4S.png", @"Computer Systems5S.png", @"Computer Architecture6S.png", @"Concepts, Techniques, and Models of Computer Programming7S.png", @"计算机程序的构造和解释8S.png", @"计算机程序设计艺术（第1卷）9S.png", @"算法导论10S.png", @"Computer Networking11S.png", @"The Computer Music Tutorial12S.png", @"Introduction to Algorithms13S.png", @"ACM图灵奖演讲集14S.png", @"Compilers15S.png", @"通灵芯片16S.png", @"算法设计与分析基础17S.png", @"现代操作系统18S.png", @"Computer Networking19S.png", @"ACM图灵奖20S.png", nil];
    return bookimage;
}
-(NSArray *)bookAuthor
{
    [self getdataBookName];
    return listBookauthor;
}
-(NSArray *)bookSummary
{
    [self getdataBookName];
    return listBookSummary;
}
-(NSArray *)bookName
{
    [self getdataBookName];
    return listBookName;
}
-(NSArray *)bookPrice
{
    [self getdataBookName];
    return listbookPrice;
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
