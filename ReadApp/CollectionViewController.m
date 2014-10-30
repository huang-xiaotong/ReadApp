//
//  CollectionViewController.m
//  ReadApp
//
//  Created by xyooyy on 14/10/29.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "CollectionViewController.h"
#import "CenterView.h"
@interface CollectionViewController ()

@end

@implementation CollectionViewController
@synthesize bookImage;
@synthesize bookName;
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
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    fl.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    fl.minimumLineSpacing = 5;
    m_collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:fl];
    m_collectionView.backgroundColor = [UIColor orangeColor];
    [m_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    m_collectionView.delegate = self;
    m_collectionView.dataSource = self;
    [self.view addSubview:m_collectionView];
    CenterView *centerView = [[CenterView alloc]init];
    self.bookImage = [centerView bookImageSmall];
    self.bookName = [centerView bookName];
    listNameAndImage = [[NSMutableArray alloc]init];
    for(NSInteger index = 0;index<[bookImage count]; index++){
        UIImage *image = bookImage[index];
        NSString *title = bookName[index];
        NSArray *bookNameAndImage = [[NSArray alloc]initWithObjects:image,title, nil];
        [listNameAndImage addObject:bookNameAndImage];
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Collection View Data Source
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.bookName.count;
//    return 5;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(96, 100);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
        static NSString *CellIdentifier = @"GradientCell";
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    UIImage *image = [[UIImage alloc]init];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 96, 100);
    imageView.image = [self.bookImage objectAtIndex:indexPath.row];
    imageView.backgroundColor = [UIColor redColor];
    [cell.contentView addSubview:imageView];
        return cell;
};
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
