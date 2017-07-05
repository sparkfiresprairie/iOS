//
//  City.h
//  Storm
//
//  Created by Xingyuan Wang on 7/3/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class WeatherData;

@interface City : NSObject

@property (nonatomic, copy) NSString *cityId;
@property (nonatomic, copy) NSString *cityName;
@property (nonatomic) CGFloat longitude;
@property (nonatomic) CGFloat latitude;
@property (nonatomic, strong) WeatherData *weatherData;
@property (nonatomic, copy) NSArray *forecastData;

- (instancetype)initWithCityId:(NSString *)cityId andCityName:(NSString *)cityName;

@end
