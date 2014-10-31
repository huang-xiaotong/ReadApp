//
//  BookInformation.h
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookInformation : NSObject
{
    NSMutableArray *listbookPrice;
    NSMutableArray *listBookName;
    NSMutableArray *listBookAuthor;
    NSMutableArray *listBookSummary;
    NSMutableArray *listBookArrayauthor;
    NSMutableArray *listBookImage;
    NSMutableArray *listBookArrayImageSmall;
    NSMutableArray *listBookImageSmall;
    NSMutableArray *listBookImageMid;
    NSMutableArray *listBookArrayImageMid;
}
-(NSArray *)bookImageMid;
-(NSArray *)bookAuthor;
-(NSArray *)bookPrice;
-(NSArray *)bookName;
-(NSArray *)bookSummary;
-(NSArray *)bookImageSmall;
@end
