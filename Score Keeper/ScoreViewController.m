//
//  SKViewController.m
//  Score Keeper
//
//  Created by jonathan thornburg on 4/28/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()<UITextFieldDelegate>

@property (strong,nonatomic) UIScrollView *scrollView;

@property (strong,nonatomic) NSMutableArray *scoreLabels;

@property (nonatomic, strong) UITextField *name;

@end

@implementation ScoreViewController

CGFloat topRow = 25;
CGFloat margin = 15;
CGFloat top = 0;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenWidth = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    self.scoreLabels = [NSMutableArray new];
    
    self.scrollView = [UIScrollView new];
    
    self.title = @"Score Keeper";
    self.scrollView.frame = CGRectMake(0, topRow, screenWidth, screenHeight);
    self.scrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.scrollView];
    CGSize contentSize = CGSizeMake(screenWidth, screenHeight * 2);
    self.scrollView.contentSize = contentSize;
    
    for (int i = 0; i<4; i++) {
        [self addScoreView:i];
    }
    

}
- (void)addScoreView:(int)index
{
    CGFloat scrollViewWidth = self.view.frame.size.width;
    
    UIView *boxView = [UIView new];
    boxView.frame = CGRectMake(0, top + 2, scrollViewWidth, 100);
    boxView.backgroundColor = [UIColor orangeColor];
    [self.scrollView addSubview:boxView];
    
    self.name = [UITextField new];
    self.name.delegate = self;
    self.name.frame = CGRectMake(margin - 5, 40, 70, 20);
    self.name.backgroundColor = [UIColor whiteColor];
    self.name.placeholder = @"Name";
    [boxView addSubview:self.name];
    
    UILabel *score = [UILabel new];
    score.frame = CGRectMake(120, 40, 35, 20);
    score.text = @"0";
    score.backgroundColor = [UIColor whiteColor];
    [boxView addSubview:score];
    [self.scoreLabels addObject:score];
    
    UIStepper *button = [UIStepper new];
    button.minimumValue = -100;
    button.maximumValue = 100;
    button.tag = index;
    button.frame = CGRectMake(scrollViewWidth - 125, 40, 50, 20);
    [button addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    [boxView addSubview:button];
    
    top += 110;

}
- (void)valueChanged:(UIStepper *)sender
{
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    int value = [stepper value];
    
    UILabel *label = self.scoreLabels[index];
    label.text = [NSString stringWithFormat:@"%d", value];
}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    
//    [textField becomeFirstResponder];
//}

#pragma mark - TextField Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
