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
- (void)viewDidLoad
{
    self.title = @"test";
    m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    m_tableView.backgroundColor = [UIColor colorWithRed:178.0/255.0 green:156.0/255.0 blue:56.0/255.0 alpha:1.0];
    [self.view addSubview:m_tableView];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    TestView *testview = [[TestView alloc]init];
    [testview show:self action:@selector(press:) labelview:self.view buttonview:self.view];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)press: (id)sender
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
