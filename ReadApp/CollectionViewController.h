//
//  CollectionViewController.h
//  ReadApp
//
//  Created by xyooyy on 14/10/29.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController
<UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *listNameAndImage;
    UICollectionView *m_collectionView;
}
@property (strong, nonatomic)NSArray *bookImage;// 数据源
@property (nonatomic, retain)NSArray *bookName;
@end
