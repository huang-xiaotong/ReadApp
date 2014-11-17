//
//  BookInformation.m
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "BookInformation.h"
@implementation BookInformation
-(NSArray *)analysisDataGetBookInformation
{
    NSError *error;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.douban.com/v2/book/search?tag=computer"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    NSArray *listbook = [dic objectForKey:@"books"];
    return listbook;
}
-(NSString *)path
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    return path;
}
-(NSArray *)getdataBookInformation
{
    NSString *path = [self path];
    NSString *orderfile=[path stringByAppendingPathComponent:@"read.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:orderfile]){
    NSArray *BookInformation = [self analysisDataGetBookInformation];
    [[NSFileManager defaultManager] createFileAtPath:orderfile contents:nil attributes:nil];
    [BookInformation writeToFile:orderfile atomically:YES];
        NSString *file=[path stringByAppendingPathComponent:@"read.plist"];
        NSArray *booked = [[NSArray alloc]initWithContentsOfFile:file];
        return booked;
    }
        else{
    NSString *file=[path stringByAppendingPathComponent:@"read.plist"];
    NSArray *booked = [[NSArray alloc]initWithContentsOfFile:file];
            return booked;
        }
}
-(NSMutableArray *)bookInformation
{
    NSArray *book = [self getdataBookInformation];
    NSMutableArray *listArrayBook = [[NSMutableArray alloc]init];
    for (int i = 0; i<[book count]; i++)
    {
//    NSDictionary *listBookInformation = [[NSDictionary alloc]initWithObjectsAndKeys:[book[i] objectForKey:@"price"],@"price",[[book[i] objectForKey:@"author"] componentsJoinedByString:@","],@"author",[book[i] objectForKey:@"title"],@"title",[self getImage:@"small"][i],@"smallimage",[self getImage:@"medium"][i],@"Midimage",[book[i] objectForKey:@"summary"],@"summary", nil];
//        [listArrayBook addObject:listBookInformation];
        NSDictionary *listBookInformation = [[NSDictionary alloc]initWithObjectsAndKeys:[book[i] objectForKey:@"price"],@"price",[[book[i] objectForKey:@"author"] componentsJoinedByString:@","],@"author",[book[i] objectForKey:@"title"],@"title",[book[i] objectForKey:@"summary"],@"summary",[[book[i] objectForKey:@"images"] objectForKey:@"small"],@"smallImage", [[book[i] objectForKey:@"images"] objectForKey:@"medium"],@"midImage", nil];
        [listArrayBook addObject:listBookInformation];

    }
    return listArrayBook;
}
-(NSMutableArray*)getImage :(NSString *)imageType
{
    NSMutableArray *Image = [[NSMutableArray alloc]init];
    NSArray *book = [self getdataBookInformation];
    for (int index = 0; index < [book count]; index ++) {
        NSString *http = [[book[index] objectForKey:@"images"] objectForKey:imageType];
        NSURL * url = [NSURL URLWithString:http];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        [Image addObject:image];
    }
    return Image;
}

//-(NSArray *)getdataBookAndSave
//{
//    NSString *path=[self path];
//    NSString *orderfile=[path stringByAppendingPathComponent:@"book.plist"];
//    if (![[NSFileManager defaultManager] fileExistsAtPath:orderfile]){
//        NSArray *listBookInformationNeeds = [self bookInformation];
//        [[NSFileManager defaultManager] createFileAtPath:orderfile contents:nil attributes:nil];
//        [listBookInformationNeeds writeToFile:orderfile atomically:YES];
//        NSLog(@"%@",listBookInformationNeeds[0]);
//        NSString *file=[path stringByAppendingPathComponent:@"book.plist"];
//        NSArray *bookNeeds = [[NSArray alloc]initWithContentsOfFile:file];
//        NSLog(@"bookNeeds:%@",bookNeeds);
//        return bookNeeds;}
//    else{
//        NSString *file=[path stringByAppendingPathComponent:@"book.plist"];
//        NSArray *bookNeeds = [[NSArray alloc]initWithContentsOfFile:file];
//        return bookNeeds;}
//}
-(NSMutableArray *)bookinformation
{
    return [self bookInformation];
}

@end
