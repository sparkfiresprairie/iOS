//
//  CityView.m
//  Storm
//
//  Created by Xingyuan Wang on 7/4/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "CityView.h"

#import "City.h"
#import "ForecastView.h"
#import "WeatherData.h"
#import "WeatherDataView.h"

static const CGFloat kImageWidth = 200;
static const CGFloat kPaddingTop = 60;
static const CGFloat kGlobalPadding = 30;
static const CGFloat kConditionLableHeight = 25;
static const CGFloat kCityNameLabelHeight = 25;

@interface CityView () <UIScrollViewDelegate>

@end

@implementation CityView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
{
    UIScrollView *_scrollView;
    UIImageView *_weatherIcon;
    UILabel *_shortCondition;
    UILabel *_cityName;
    ForecastView *_forecastView;
    WeatherDataView *_weatherDetails;
}

- (instancetype)initWithCity:(City *)city
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        _weatherIcon = [[UIImageView alloc] init];
        _weatherIcon.contentMode = UIViewContentModeScaleAspectFit;
        _weatherIcon.image = [UIImage imageNamed:city.weatherData.iconName];
        [self addSubview:_weatherIcon];
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        _shortCondition = [[UILabel alloc] init];
        _shortCondition.text = [NSString stringWithFormat:@"%@, %ld˚", city.weatherData.shortCondition,city.weatherData.temperature];
        _shortCondition.textColor = [UIColor whiteColor];
        _shortCondition.textAlignment = NSTextAlignmentCenter;
        _shortCondition.font = [UIFont systemFontOfSize:20];
        [_scrollView addSubview:_shortCondition];
        
        _cityName = [[UILabel alloc] init];
        _cityName.text = city.cityName;
        _cityName.textColor = [UIColor lightGrayColor];
        _cityName.textAlignment = NSTextAlignmentCenter;
        [_scrollView addSubview:_cityName];
        
        _forecastView = [[ForecastView alloc] initWithForecastData:city.forecastData];
        [_scrollView addSubview:_forecastView];
        
        _weatherDetails = [[WeatherDataView alloc] initWithWeatherData:city.weatherData];
        [_scrollView addSubview:_weatherDetails];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat y = kPaddingTop;
    
    _scrollView.frame = self.bounds;
    
    _weatherIcon.frame = CGRectMake((width - kImageWidth) / 2, y, kImageWidth, kImageWidth);
    y += kImageWidth + kGlobalPadding;
    
    _shortCondition.frame = CGRectMake(0, y, width, kConditionLableHeight);
    y += kConditionLableHeight;
    
    _cityName.frame = CGRectMake(0, y, width, kCityNameLabelHeight);
    y += kCityNameLabelHeight + kGlobalPadding;
    
    _forecastView.frame = CGRectMake(0, y, width, 120);
    y += 120 + kGlobalPadding;
    
    _weatherDetails.frame = CGRectMake(0, y, width, 120);
    y += 120;
    
    _scrollView.contentSize = CGSizeMake(width, y + 80);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _weatherIcon.alpha = 1 - (_scrollView.contentOffset.y / 250.0);
}

@end
