//
//  BookInformation.m
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "BookInformation.h"
@implementation BookInformation
@synthesize path;
@synthesize book;
@synthesize listArrayBook;
-(void)getdataBookInformation
{
    //将数组list保存到本地并获取数据
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    path=[paths objectAtIndex:0];
    NSString *orderfile=[path stringByAppendingPathComponent:@"read.plist"];
    NSFileManager *ordered = [NSFileManager defaultManager];
    if (![[NSFileManager defaultManager] fileExistsAtPath:orderfile])
    {
    NSError *error;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/book/search?tag=computer"]];
    
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    //获取数组list的内容
    NSArray *list = [dic objectForKey:@"books"];
    [ordered createFileAtPath:orderfile contents:nil attributes:nil];
    NSArray *bookinfor = [[NSArray alloc]initWithArray:list];
    [bookinfor writeToFile:orderfile atomically:YES];
        NSString *file=[self.path stringByAppendingPathComponent:@"read.plist"];
        NSArray *booked = [[NSArray alloc]initWithContentsOfFile:file];
        self.book = booked;
    }
        else{
    NSString *file=[self.path stringByAppendingPathComponent:@"read.plist"];
    NSArray *booked = [[NSArray alloc]initWithContentsOfFile:file];
            self.book = booked;
        }
    //初始化成员变量
    listArrayBook = [[NSMutableArray alloc]init];
    for (int i = 0; i<[book count]; i++)
    {
    listBookInformation = [[NSMutableDictionary alloc]initWithObjectsAndKeys:[book[i] objectForKey:@"price"],@"price",[[book[i] objectForKey:@"author"] componentsJoinedByString:@","],@"author",[book[i] objectForKey:@"title"],@"title",[self getimage:[[book[i] objectForKey:@"images"] objectForKey:@"small"]],@"smallimage",[self getimage:[[book[i] objectForKey:@"images"] objectForKey:@"medium"]],@"Midimage",[book[i] objectForKey:@"summary"],@"summary", nil];
        [self.listArrayBook addObject:listBookInformation];
    }
}
-(UIImage *)getimage :(NSString *)http
{
    NSURL * url = [NSURL URLWithString:http];
    NSData * data = [[NSData alloc]initWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc]initWithData:data];
    return image;
}
-(NSMutableArray *)bookinformation
{
    [self getdataBookInformation];
    return self.listArrayBook;
}

@end
