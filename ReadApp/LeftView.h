//
//  LeftView.h
//  ReadApp
//
//  Created by xyooyy on 14/10/23.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftView : UIView
<UITableViewDelegate, UITableViewDataSource>
{
}
@property (nonatomic, retain) NSArray *listbookmenu;
-(void) bookName;

@end
