//
//  ForecastView.m
//  Storm
//
//  Created by Xingyuan Wang on 7/4/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "ForecastView.h"

#import "ForecastData.h"
#import "ForecastSingleDayView.h"

@implementation ForecastView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
{
    NSMutableArray<ForecastSingleDayView *> *_forecastSingleDayViews;
}

- (instancetype)initWithForecastData:(NSArray<ForecastData *> *)forecastData
{
    self = [super init];
    if (self) {
        _forecastSingleDayViews = [[NSMutableArray<ForecastSingleDayView *> alloc] init];
        for (NSInteger i = 0; i < forecastData.count; i++) {
            ForecastSingleDayView *forecastSingleDayView = [[ForecastSingleDayView alloc] initWithForecastData:forecastData[i]];
            [_forecastSingleDayViews addObject:forecastSingleDayView];
            [self addSubview:forecastSingleDayView];
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    NSInteger daysCount = _forecastSingleDayViews.count;
    for (NSInteger i = 0; i < daysCount; i++) {
        ForecastSingleDayView *forecastSingleDayView = _forecastSingleDayViews[i];
        forecastSingleDayView.frame = CGRectMake(i * width / daysCount, 0, width / daysCount, height);
    }
}

@end
