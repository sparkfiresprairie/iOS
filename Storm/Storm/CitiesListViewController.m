//
//  CitiesListViewController.m
//  Storm
//
//  Created by Xingyuan Wang on 7/6/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "CitiesListViewController.h"

#import "ForecastData.h"
#import "City.h"
#import "CityViewController.h"
#import "SearchViewController.h"
#import "WeatherData.h"

@interface CitiesListViewController () <SearchViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation CitiesListViewController
{
    UITableView *_tableView;
    NSArray<City *> *_cities;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        City *city = [[City alloc] initWithCityId:@"168940" andCityName:@"Menlo Park"];
        city.latitude = 37.45;
        city.longitude = -122.18;
        
        WeatherData *weatherData = [[WeatherData alloc] init];
        weatherData.temperature = 15;
        weatherData.maxDegree = 20;
        weatherData.minDegree = 8;
        weatherData.humidity = 69;
        weatherData.windAngle = 347;
        weatherData.windSpeed = 1.86;
        weatherData.shortCondition = @"Clear";
        weatherData.longCondition = @"Sky is Clear";
        weatherData.iconName = @"01d";
        city.weatherData = weatherData;
        city.forecastData = [self createRandomForecast];
        _cities = @[city];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Storm";
    
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(_addCityClicked)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_tableView];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _tableView.frame = self.view.bounds;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (NSArray<ForecastData *> *)createRandomForecast
{
    NSMutableArray<ForecastData *> *forecastArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 7; i++) {
        ForecastData *forecast = [[ForecastData alloc] init];
        forecast.date = [NSDate dateWithTimeIntervalSince1970:arc4random() % 14000000];
        forecast.maxDegree = arc4random() % 100;
        forecast.minDegree = arc4random() % 100;
        forecast.chancesOfRain = arc4random() % 100;
        forecast.iconName = @"01d";
        [forecastArray addObject:forecast];
    }
    return forecastArray;
}

- (void)_addCityClicked
{
    SearchViewController *searchViewController = [[SearchViewController alloc] init];
    searchViewController.delegate = self;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - SearchViewControllerDelegate
- (void)dismissSearchViewController:(SearchViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)searchViewController:(SearchViewController *)viewController didSelectCityName:(NSString *)cityName
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", cityName);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor blackColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    City *city = _cities[indexPath.row];
    cell.textLabel.text = city.cityName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityViewController *cityViewController = [[CityViewController alloc] initWithCity:_cities[indexPath.row]];
    [self.navigationController pushViewController:cityViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
