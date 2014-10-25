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
@interface ViewController ()

@end

@implementation ViewController
@synthesize listbookPicture;
@synthesize listbookName;
@synthesize listbookAuthor;
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
    [self bookImage];
    [self bookName];
    [self bookAuthor];
    [super viewDidLoad];
}
-(void)bookImage
{
    NSArray *bookimage = [[NSArray alloc]initWithObjects:@"深入理解计算机系统s.png", @"Structure and Interpretation of Computer Programs - 2nd Edition (MIT) 2S.png", @"Hackers and Painters 3S.png", @"计算机网络4S.png", @"Computer Systems5S.png", @"Computer Architecture6S.png", @"Concepts, Techniques, and Models of Computer Programming7S.png", @"计算机程序的构造和解释8S.png", @"计算机程序设计艺术（第1卷）9S.png", @"算法导论10S.png", @"Computer Networking11S.png", @"The Computer Music Tutorial12S.png", @"Introduction to Algorithms13S.png", @"ACM图灵奖演讲集14S.png", @"Compilers15S.png", @"通灵芯片16S.png", @"算法设计与分析基础17S.png", @"现代操作系统18S.png", @"Computer Networking19S.png", @"ACM图灵奖20S.png", nil];
    self.listbookPicture = bookimage;
}
-(void)bookName
{
    NSArray *bookmenu = [[NSArray alloc]initWithObjects:@"深入理解计算机系统",@"Structure and Interpretation of Computer Programs - 2nd Edition (MIT)",@"Hackers and Painters",@"计算机网络",@"Computer Systems",@"Computer Architecture",@"Concepts, Techniques, and Models of Computer Programming",@"计算机程序的构造和解释",@"计算机程序设计艺术（第1卷）",@"算法导论",@"Computer Networking",@"The Computer Music Tutorial",@"Introduction to Algorithms",@"ACM图灵奖演讲集",@"Compilers",@"通灵芯片",@"算法设计与分析基础",@"现代操作系统",@"Computer Networking",@"ACM图灵奖", nil];
    self.listbookName = bookmenu;
}
-(void)bookAuthor
{
    NSArray *bookAuthor = [[NSArray alloc]initWithObjects:@"Randal E.Bryant \n David O'Hallaron", @"Harold Abelson \n Gerald Jay Sussman", @"Paul Graham",@"Andrew S. Tanenbaum",@"Randal E. Bryant \n David R. O'Hallaron", @"John L. Hennessy \n David A. Patterson",@"Peter Van Roy \n Seif Haridi", @"Harold Abelson \n Gerald Jay Sussman \n Julie Sussman",@"[美] Donald E. Knuth", @"[美] Thomas H.Cormen \n Charles E.Leiserson \n Charles E.Leiserson \n Clifford Stein", @"James F. Kurose \n Keith W. Ross", @"Curtis Roads", @"Thomas H. Cormen \n Charles E. Leiserson \n Ronald L. Rivest \n Clifford Stein", @"阿申豪斯特", @"Alfred V. Aho \n Monica S. Lam \n Ravi Sethi \n Jeffrey D. Ullman", @"丹尼尔·希利斯", @"（美）莱维丁（Levitin/A.）/潘彦", @"Andrew S. Tanenbaum", @"James F. Kurose \n Keith W. Ross", @""
                           , nil];
    self.listbookAuthor = bookAuthor;
//    NSLog(@"%@",bookAuthor);
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
-(UILabel*)creatLabel:(CGRect)frame :(NSString*)labelText :(double)fontsize
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = labelText;
    label.textColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:fontsize];
//    label.numberOfLines = 0;
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
//    NSUInteger row = [indexPath row];
    UIImageView *imageView = [self imageBookPicture:[self.listbookPicture objectAtIndex:indexPath.row]];
    [m_cell.contentView addSubview:imageView];
    UILabel *labelName = [self creatLabel:CGRectMake(100, 10, 200, 20) :[self.listbookName objectAtIndex:indexPath.row] :14];
    [m_cell.contentView addSubview:labelName];
    UILabel *labelAuthor = [self creatLabel:CGRectMake(100, 30, 50, 20) :@"作者：" :14];
    [m_cell.contentView addSubview:labelAuthor];
    UILabel *labelAuthorName = [self creatLabel:CGRectMake(150, 30, 180, 90) :[self.listbookAuthor objectAtIndex:indexPath.row] :12];
    labelAuthorName.numberOfLines = 0;
    labelAuthorName.backgroundColor = [UIColor redColor];
    [m_cell.contentView addSubview:labelAuthorName];
    return m_cell;
}

@end
