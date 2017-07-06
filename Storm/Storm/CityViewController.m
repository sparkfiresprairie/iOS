//
//  CityViewController.m
//  Storm
//
//  Created by Xingyuan Wang on 7/5/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "CityViewController.h"

#import "City.h"
#import "CityView.h"

@interface CityViewController ()

@end

@implementation CityViewController
{
    City *_city;
}

- (instancetype)initWithCity:(City *)city
{
    self = [super init];
    if (self) {
        _city = city;
    }
    return self;
}

- (void)loadView
{
    self.view = [[CityView alloc] initWithCity:_city];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
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
