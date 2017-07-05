//
//  ForecastSingleDayView.h
//  Storm
//
//  Created by Xingyuan Wang on 7/4/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForecastData;

@interface ForecastSingleDayView : UIView

- (instancetype)initWithForecastData:(ForecastData *)forecastData;

@end
