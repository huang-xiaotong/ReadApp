//
//  LeftViewController.h
//  ReadApp
//
//  Created by xyooyy on 14/10/22.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "testViewController.h"
@interface LeftViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *listbookName;
    ViewController *viewCtrl;
    testViewController *testCtrl;
}
@property(nonatomic,retain)NSMutableArray *listbookmenu;
- (id)init :(UINavigationController *)viewControl :(testViewController *)testControl;
@end
