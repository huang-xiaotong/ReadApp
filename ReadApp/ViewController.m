//
//  ViewController.m
//  ReadApp
//   iOS学习之UINavigationController详解与使用(一)添加UIBarButtonItem
//http://beyondvincent.com/blog/2013/11/03/120-customize-navigation-status-bar-ios-7/
//  Created by xyooyy on 14/10/20.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "PictureViewController.h"
#import "CenterView.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize listbookPicture;
@synthesize listbookName;
@synthesize listbookAuthor;
@synthesize listbookPrice;
@synthesize listbookSummary;
- (void)viewDidLoad
{
    self.title = @"书单";
//    self.view.backgroundColor = [UIColor orangeColor];
    m_tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    m_tableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:m_tableView];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [self setupRightPicButton];
    [self setupLeftMenuButton];
    [self CenterView];
    [super viewDidLoad];
}
-(void) CenterView
{
    CenterView *centerView = [[CenterView alloc]init];
    self.listbookPicture = [centerView bookImage];
    self.listbookName = [centerView bookName];
    self.listbookAuthor = [centerView bookAuthor];
    self.listbookPrice = [centerView bookPrice];
}
-(void)setupRightPicButton
{
    MMDrawerBarButtonItem *rightButton = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(rightButtonPress)];
    [self.navigationItem setRightBarButtonItem:rightButton animated:YES];
}
-(void)rightButtonPress
{
    PictureViewController *pictureCtrl = [[PictureViewController alloc]init];
    [self.navigationController pushViewController:pictureCtrl animated:YES];
}
- (void)setupLeftMenuButton
{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}
- (void)leftDrawerButtonPress
{
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UILabel*)creatLabel:(CGRect)frame :(NSString*)labelText :(double)fontsize :(UIColor *)textcolor
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = labelText;
    label.textColor =textcolor;
    label.font = [UIFont systemFontOfSize:fontsize];
    return label;
}
-(UIImageView*)imageBookPicture:(NSString*)imageNamed
{
    UIImage *image = [[UIImage alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.image =[UIImage imageNamed:imageNamed];
    return imageView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listbookName.count;
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    m_cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (m_cell == nil)
    {
        m_cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        m_cell.backgroundColor = [UIColor lightTextColor];

    }
    UIImageView *imageView = [self imageBookPicture:[self.listbookPicture objectAtIndex:indexPath.row]];
    [m_cell.contentView addSubview:imageView];
    UILabel *labelName = [self creatLabel:CGRectMake(100, 10, 200, 20) :[self.listbookName objectAtIndex:indexPath.row] :14 :[UIColor blueColor]];
    [m_cell.contentView addSubview:labelName];
    UILabel *labelAuthor = [self creatLabel:CGRectMake(100, 30, 45, 30) :@"作者：" :14 :[UIColor blackColor]];
    [m_cell.contentView addSubview:labelAuthor];
    UILabel *labelAuthorName = [self creatLabel:CGRectMake(145, 30, 180, 30) :[self.listbookAuthor objectAtIndex:indexPath.row] :12 :[UIColor blackColor]];
    labelAuthorName.numberOfLines = 0;
    [m_cell.contentView addSubview:labelAuthorName];
    UILabel *labelprice = [self creatLabel:CGRectMake(100, 60, 45, 20) :@"价格：" :14 :[UIColor blackColor]];
    [m_cell.contentView addSubview:labelprice];
    UILabel *labelPrice = [self creatLabel:CGRectMake(145, 60, 80, 20) :[self.listbookPrice objectAtIndex:indexPath.row] :12 :[UIColor blackColor]];
    [m_cell.contentView addSubview:labelPrice];
    UILabel *labelsummary = [self creatLabel:CGRectMake(100, 80, 45, 20) :@"简介" :14 :[UIColor blackColor]];
    [m_cell.contentView addSubview:labelsummary];
    
    return m_cell;
}
@end
