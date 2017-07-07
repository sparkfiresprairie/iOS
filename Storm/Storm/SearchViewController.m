//
//  SearchViewController.m
//  Storm
//
//  Created by Xingyuan Wang on 7/5/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "SearchViewController.h"

const static CGFloat kPadding = 20;

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@end

@implementation SearchViewController
{
    UITableView *_tableView;
    UISearchBar *_searchBar;
    NSArray<NSString *> *_listOfCities;
    NSArray<NSString *> *_filteredListOfCities;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
        _searchBar.placeholder = @"Search";
        _searchBar.barTintColor = [UIColor blackColor];
        _searchBar.delegate = self;
        
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = _searchBar;
        _tableView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_tableView];
        
        _listOfCities = @[@"Menlo Park", @"Cupertino", @"Palo Alto", @"San Francisco", @"Mountain View", @"Redwood City",
                          @"Sunnyvale", @"Daly City", @"San Jose", @"Santa Clara", @"Foster City", @"San Mateo"];
        _filteredListOfCities = _listOfCities;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillLayoutSubviews
{
    _tableView.frame = CGRectMake(0, self.topLayoutGuide.length, self.view.bounds.size.width, self.view.bounds.size.height - self.topLayoutGuide.length);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _filteredListOfCities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor blackColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }

    cell.textLabel.text = _filteredListOfCities[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate searchViewController:self didSelectCityName:_filteredListOfCities[indexPath.row]];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length == 0) {
        _filteredListOfCities = _listOfCities;
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary *bindings) {
            return [evaluatedObject rangeOfString:searchText options:NSCaseInsensitiveSearch].length != 0;
        }];
        _filteredListOfCities = [_listOfCities filteredArrayUsingPredicate:predicate];
    }
    [_tableView reloadData];
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
