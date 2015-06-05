//
//  MUHomePageViewController.m
//  manor_User_ios
//
//  Created by MR.L on 15/5/26.
//  Copyright (c) 2015年 LinQ_Mac. All rights reserved.
//

#import "MUHomePageViewController.h"

#define IMG_WIDTH ([UIScreen mainScreen].bounds.size.width >= 768 ? 70 : 46)
#define IMG_HEIGHT  ([UIScreen mainScreen].bounds.size.width >= 768 ? 83 : 55)

@interface MUHomePageViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *functionBtnView;
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *searchView;

//图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView1_1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2_1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3_1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3_2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4_1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4_2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView5_1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView5_2;

@end

@implementation MUHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"首页";
    
    [self drawLayercornerRadius];
    
    _titleView.frame = CGRectMake(0, 0, SCREENWIDTH, 44);
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 44)];
    [titleView addSubview:_titleView];
    self.navigationItem.titleView = titleView;
    
    _searchView.layer.cornerRadius = 15.0f;
    
   
}

- (void)viewWillLayoutSubviews
{
   
    NSArray *imageArray = @[@"hotActivity",@"manorFarm",@"manorTour",@"manorMoney",@"more"];
    for (int i=0;i<5;i++)
    {
        UIButton *functionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        int slide_X = (SCREENWIDTH-5*IMG_WIDTH)/10;
        int slide_Y = (76-IMG_HEIGHT)/2;
        functionBtn.frame = CGRectMake(slide_X+(2*slide_X+IMG_WIDTH)*i,slide_Y, IMG_WIDTH, IMG_HEIGHT);
        functionBtn.tag = 400+i;
        [functionBtn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [functionBtn addTarget:self action:@selector(function:) forControlEvents:UIControlEventTouchUpInside];
        [_functionBtnView addSubview:functionBtn];
    }
    
}
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"1");
}

- (void)viewDidAppear:(BOOL)animated
{
     _scrollView.contentSize = CGSizeMake(SCREENWIDTH, 1525);
}
#pragma mark 常用方法
 - (void)drawLayercornerRadius
{
    _imageView1_1.layer.cornerRadius = 5.0f;
    _imageView1_1.layer.masksToBounds = YES;
    
    _imageView2_1.layer.cornerRadius = 5.0f;
    _imageView2_1.layer.masksToBounds = YES;
    
    _imageView3_1.layer.cornerRadius = 5.0f;
    _imageView3_1.layer.masksToBounds = YES;
    
    _imageView3_2.layer.cornerRadius = 5.0f;
    _imageView3_2.layer.masksToBounds = YES;
    
    _imageView4_1.layer.cornerRadius = 5.0f;
    _imageView4_1.layer.masksToBounds = YES;
    
    _imageView4_2.layer.cornerRadius = 5.0f;
    _imageView4_2.layer.masksToBounds = YES;
    
    _imageView5_1.layer.cornerRadius = 5.0f;
    _imageView5_1.layer.masksToBounds = YES;
    
    _imageView5_2.layer.cornerRadius = 5.0f;
    _imageView5_2.layer.masksToBounds = YES;
}
#pragma mark 按钮响应Action
- (void)function:(UIButton *)button
{
     NSLog(@"按钮下标---%ld",(long)button.tag);
    int flag = (int)button.tag-400;
    
    switch (flag) {
        case 0:
            NSLog(@"热门活动");
            break;
        case 1:
            NSLog(@"农场直供");
            break;
        case 2:
            NSLog(@"庄园旅游");
            break;
        case 3:
            NSLog(@"庄园众筹");
            break;
        case 4:
            NSLog(@"更多");
            break;
            
        default:
            break;
    }
}
@end
