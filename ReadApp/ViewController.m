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
    m_tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    m_tableView.backgroundColor = [UIColor grayColor];
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
    self.listbookPicture = [centerView bookImageSmall];
    self.listbookName = [centerView bookName];
    self.listbookAuthor = [centerView bookAuthor];
    self.listbookPrice = [centerView bookPrice];
    self.listbookSummary = [centerView bookSummary];
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
-(UIImageView*)imageBookPicture:(id)imageName
{
    UIImage *image = [[UIImage alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.image =imageName;
    return imageView;
}
-(void)imageViewANDBookName:(id)imageview :(NSString *)bookName :(id)view :(NSString *)price
{
    UIImageView *imageView = [self imageBookPicture:imageview];
    [view addSubview:imageView];
    UILabel *labelName = [self creatLabel:CGRectMake(100, 10, 200, 20) :bookName :14 :[UIColor blueColor]];
    [view addSubview:labelName];
    UILabel *labelprice = [self creatLabel:CGRectMake(100, 60, 45, 20) :@"价格：" :14 :[UIColor blackColor]];
    [view addSubview:labelprice];
    UILabel *labelPrice = [self creatLabel:CGRectMake(145, 60, 80, 20) :price :12 :[UIColor blackColor]];
    [view addSubview:labelPrice];
}
-(void)AuthorAndSummary:(NSString *)Authorname :(NSString *)Summary :(id)view
{
    UILabel *labelAuthor = [self creatLabel:CGRectMake(100, 30, 45, 30) :@"作者：" :14 :[UIColor blackColor]];
    [view addSubview:labelAuthor];
    UILabel *labelAuthorName = [self creatLabel:CGRectMake(145, 30, 180, 30) :Authorname :12 :[UIColor blackColor]];
    [view addSubview:labelAuthorName];
    UILabel *labelsummary = [self creatLabel:CGRectMake(100, 80, 45, 20) :@"简介：" :14 :[UIColor blackColor]];
    [view addSubview:labelsummary];
    UILabel *labelSummary = [self creatLabel:CGRectMake(145, 80, 160, 20) :Summary :12 :[UIColor blackColor]];
    [view addSubview:labelSummary];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listbookName.count;
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil)
//    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor lightTextColor];
//    }
    [self imageViewANDBookName:[self.listbookPicture objectAtIndex:indexPath.row] :[self.listbookName objectAtIndex:indexPath.row] :cell.contentView :[self.listbookPrice objectAtIndex:indexPath.row]];
    [self AuthorAndSummary:[self.listbookAuthor objectAtIndex:indexPath.row] :[self.listbookSummary objectAtIndex:indexPath.row] :cell.contentView];
        return cell;
}
@end
