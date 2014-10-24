//
//  ViewController.m
//  ReadApp
//
//  Created by xyooyy on 14/10/20.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"
#import <MMDrawerController.h>
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.title = @"书单";
    self.view.backgroundColor = [UIColor whiteColor];
    m_tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:m_tableView];
    [self setupLeftMenuButton];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

@end
