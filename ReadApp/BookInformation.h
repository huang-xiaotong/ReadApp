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
    NSMutableDictionary *listBookInformation;
    NSMutableArray *listArrayBook;
}
-(NSMutableArray *)bookinformation;
@property (nonatomic, retain)NSArray *book;
@end
