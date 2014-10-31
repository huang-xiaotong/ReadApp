//
//  BookInformation.m
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "BookInformation.h"

@implementation BookInformation
-(void)getdataBookInformation
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
    listBookArrayauthor = [[NSMutableArray alloc]init];
    listBookImage = [[NSMutableArray alloc]init];
    //遍历数组list里的内容
    for (int i = 0; i<[list count]; i++) {
        //按数组中的索引取出对应的字典
        NSDictionary *listdicBook = [list objectAtIndex:i];
        //通过字典中的key取出对应value，并且强制转化为NSString类型
        NSString *bookName = (NSString *)[listdicBook objectForKey:@"title"];
        NSString *bookPrice = (NSString *)[listdicBook objectForKey:@"price"];
        NSString *bookSummary = (NSString *)[listdicBook objectForKey:@"summary"];
        NSArray *bookAuthor = [listdicBook objectForKey:@"author"];
        NSArray *bookImage = [listdicBook objectForKey:@"images"];
        //将获取的value值放到数组容器中
        [listBookName addObject:bookName];
        [listbookPrice addObject:bookPrice];
        [listBookSummary addObject:bookSummary];
        [listBookArrayauthor addObject:bookAuthor];
        [listBookImage addObject:bookImage];
    }
    listBookImageSmall = [self getImage:listBookImage :listBookArrayImageSmall :@"small" :listBookImageSmall];
    listBookImageMid = [self getImage:listBookImage :listBookArrayImageMid :@"medium" :listBookImageMid];
    //获取作者的数组
    listBookAuthor = [[NSMutableArray alloc]init];
    for (int i = 0; i<[listBookArrayauthor count]; i++) {
        NSString *string = [listBookArrayauthor[i] componentsJoinedByString:@","];
        [listBookAuthor addObject:string];
    }
}
-(NSMutableArray *)getImage :(NSMutableArray *)allImage :(NSMutableArray*)allSmallImage :(NSString *)str :(NSMutableArray *)Image
{
//获取Image的数组 http
allSmallImage =[[NSMutableArray alloc]init];
for (int i = 0; i<[allImage count]; i++) {
    NSString *string = [allImage[i] objectForKey:str];
    [allSmallImage addObject:string];
}
//获取Image的数组 图片
Image = [[NSMutableArray alloc]init];
for (int i = 0; i<[allSmallImage count]; i++) {
    NSURL * url = [NSURL URLWithString:allSmallImage[i]];
    NSData * data = [[NSData alloc]initWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc]initWithData:data];
    [Image addObject:image];
}
    return Image;
}
-(NSArray*)bookImageSmall
{
    [self getdataBookInformation];
    return listBookImageSmall;
}
-(NSArray *)bookImageMid
{
    [self getdataBookInformation];
    return listBookImageMid;
}
-(NSArray *)bookAuthor
{
    [self getdataBookInformation];
    return listBookAuthor;
}
-(NSArray *)bookSummary
{
    [self getdataBookInformation];
    return listBookSummary;
}
-(NSArray *)bookName
{
    [self getdataBookInformation];
    return listBookName;
}
-(NSArray *)bookPrice
{
    [self getdataBookInformation];
    return listbookPrice;
}

@end
