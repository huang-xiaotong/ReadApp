//
//  BookImageView.h
//  ReadApp
//
//  Created by xyooyy on 14/11/17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookImageView : UIImageView
{
    NSURLConnection *connection;
    NSMutableData *loadData;
}
//图片对应的缓存在沙河中的路径
@property (nonatomic, retain) NSString *fileName;

//指定默认未加载时，显示的默认图片
@property (nonatomic, retain) UIImage *placeholderImage;
//请求网络图片的URL
@property (nonatomic, retain) NSString *imageURL;
//图片缓存地址的文件名
//@property (nonatomic, retain) NSString *imageSizeName;

@end

