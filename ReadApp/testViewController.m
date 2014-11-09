//
//  testViewController.m
//  ReadApp
//
//  Created by xyooyy on 14/11/7.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "testViewController.h"
#import "LeftViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "TestView.h"
@interface testViewController ()

@end

@implementation testViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//-(id)init :(UIViewController *)center
//{
//    self = [super init];
//    if (self) {
//        center = self;
//    }
//    return  self;
//}
- (void)viewDidLoad
{
    self.title = @"test";
    m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    m_tableView.backgroundColor = [UIColor colorWithRed:178.0/255.0 green:156.0/255.0 blue:56.0/255.0 alpha:1.0];
    [self.view addSubview:m_tableView];
    [self setupLeftMenuButton];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [self show];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)show
{
    TestView *testView = [[TestView alloc]init];
    [testView creatlabel:[UIColor colorWithRed:78.0/255.0 green:156.0/255.0 blue:156.0/255.0 alpha:1.0] :CGRectMake(0, 0, 320, 40) :@"test" :[UIColor blueColor] :self.view];
    UIButton *returnbutton = [testView creatbutton:[UIColor whiteColor] :CGRectMake(10, 20, 50, 20) :@"返回" ];
    [returnbutton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnbutton];
}
-(void)press: (id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 13;
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor lightTextColor];
    }
    cell.backgroundColor = [UIColor colorWithRed:178.0/255.0 green:156.0/255.0 blue:56.0/255.0 alpha:1.0];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
