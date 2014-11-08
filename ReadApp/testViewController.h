//
//  testViewController.h
//  ReadApp
//
//  Created by xyooyy on 14/11/7.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *m_tableView;
}
//-(id)init :(UIViewController *)center;
@end
