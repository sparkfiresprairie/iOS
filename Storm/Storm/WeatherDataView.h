//
//  WeatherDataView.h
//  Storm
//
//  Created by Xingyuan Wang on 7/4/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherData;

@interface WeatherDataView : UIView

- (instancetype)initWithWeatherData:(WeatherData *)weatherData;

@end
