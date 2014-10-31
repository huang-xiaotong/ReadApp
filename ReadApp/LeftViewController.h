//
//  LeftViewController.h
//  ReadApp
//
//  Created by xyooyy on 14/10/22.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
}
@property(nonatomic,retain)NSArray *listbookmenu;
@end
