//
//  SKViewController.m
//  Score Keeper
//
//  Created by jonathan thornburg on 4/28/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat topRow = 20;
    CGFloat margin = 15;
    CGFloat screenWidth = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    
    
    UIScrollView *scrollview = [UIScrollView new];
    self.title = @"Score Keeper";
    scrollview.frame = CGRectMake(margin, topRow, screenWidth - 30, screenHeight);
    scrollview.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:scrollview];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
