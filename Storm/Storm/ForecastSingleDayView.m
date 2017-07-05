//
//  ForecastSingleDayView.m
//  Storm
//
//  Created by Xingyuan Wang on 7/4/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "ForecastSingleDayView.h"
#import "ForecastData.h"

@implementation ForecastSingleDayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
{
    UIImageView *_weatherIcon;
    UILabel *_day;
    UILabel *_maxTemperature;
    UILabel *_minTemperature;
    UILabel *_chancesOfRain;
}

- (instancetype)initWithForecastData:(ForecastData *)forecastData
{
    self = [super init];
    if (self) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"E"];
        
        _day = [self _createLabelWithText:[dateFormatter stringFromDate:forecastData.date]];
        
        _maxTemperature = [self _createLabelWithText:[NSString stringWithFormat:@"%ld˚", forecastData.maxDegree]];
        
        _minTemperature = [self _createLabelWithText:[NSString stringWithFormat:@"%ld˚", forecastData.minDegree]];
        
        _chancesOfRain = [self _createLabelWithText:[NSString stringWithFormat:@"%ld%%", forecastData.chancesOfRain]];
        
        _weatherIcon = [[UIImageView alloc] init];
        _weatherIcon.image = [UIImage imageNamed:forecastData.iconName];
        _weatherIcon.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_weatherIcon];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    _day.frame = CGRectMake(0, 0, width, height / 5);
    _weatherIcon.frame = CGRectMake(0, height * 0.2, width, height / 5);
    _maxTemperature.frame = CGRectMake(0, height * 0.4, width, height / 5);
    _minTemperature.frame = CGRectMake(0, height * 0.6, width, height / 5);
    _chancesOfRain.frame = CGRectMake(0, height * 0.8, width, height / 5);
}

#pragma mark - Private
- (UILabel *)_createLabelWithText:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    return label;
}

@end
