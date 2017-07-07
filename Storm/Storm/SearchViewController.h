//
//  SearchViewController.h
//  Storm
//
//  Created by Xingyuan Wang on 7/5/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchViewController;

@protocol SearchViewControllerDelegate <NSObject>

- (void)dismissSearchViewController:(SearchViewController *)viewController;
- (void)searchViewController:(SearchViewController *)viewController didSelectCityName:(NSString *)cityName;

@end

@interface SearchViewController : UIViewController

@property (nonatomic, weak) id<SearchViewControllerDelegate> delegate;

@end
