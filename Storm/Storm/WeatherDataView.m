//
//  WeatherDataView.m
//  Storm
//
//  Created by Xingyuan Wang on 7/4/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "WeatherDataView.h"

#import "WeatherData.h"

static const CGFloat kRowSize = 22;
static const CGFloat kRowPadding = 5;
static const CGFloat kVerticalPadding = 20;

@implementation WeatherDataView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
{
    UILabel *_today;
    UILabel *_chancesOfRain;
    UILabel *_chancesOfRainValue;
    UILabel *_humidity;
    UILabel *_humidityValue;
    UILabel *_wind;
    UILabel *_windValue;
    UILabel *_pressure;
    UILabel *_pressureValue;
    UIImageView *_windAngle;
}

- (instancetype)initWithWeatherData:(WeatherData *)weatherData
{
    self = [super init];
    if (self) {
        NSString *todayString = [NSString stringWithFormat:@"Today: %@. The high will be %ld. The low will be %ld", weatherData.longCondition, weatherData.maxDegree, weatherData.minDegree];
        
        _today = [self _createLableWithText:todayString alignment:NSTextAlignmentLeft];
        _today.numberOfLines = 0;
        
        _humidity = [self _createLableWithText:@"Humidity:" alignment:NSTextAlignmentRight];
        _humidityValue = [self _createLableWithText:[NSString stringWithFormat:@"  %ld%%", weatherData.humidity] alignment:NSTextAlignmentLeft];
        
        _wind = [self _createLableWithText:@"Wind:" alignment:NSTextAlignmentRight];
        _windValue = [self _createLableWithText:[NSString stringWithFormat:@"  %.2f kph", weatherData.windSpeed] alignment:NSTextAlignmentLeft];
        
        _pressure = [self _createLableWithText:@"Pressure:" alignment:NSTextAlignmentRight];
        _pressureValue = [self _createLableWithText:[NSString stringWithFormat:@"  %.3f mb", weatherData.pressure] alignment:NSTextAlignmentLeft];
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat halfWidth = width / 2;
    CGFloat y = 0;
    
    CGRect todayRect = [_today.text boundingRectWithSize:CGSizeMake(width - 2 * kVerticalPadding, CGFLOAT_MAX)
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]}
                                                 context:nil];
    _today.frame = CGRectMake(kVerticalPadding, 0, todayRect.size.width, todayRect.size.height);
    y += todayRect.size.height + kRowPadding;
    
    _humidity.frame = CGRectMake(0, y, halfWidth, kRowSize);
    _humidityValue.frame = CGRectMake(halfWidth, y, halfWidth, kRowSize);
    y += kRowSize + kRowPadding;
    
    _wind.frame = CGRectMake(0, y, halfWidth, kRowSize);
    _windValue.frame = CGRectMake(halfWidth, y, halfWidth, kRowSize);
    y += kRowSize + kRowPadding;
    
    _pressure.frame = CGRectMake(0, y, halfWidth, kRowSize);
    _pressureValue.frame = CGRectMake(halfWidth, y, halfWidth, kRowSize);
}

#pragma mark - Private

- (UILabel *)_createLableWithText:(NSString *)text alignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = alignment;
    label.font = [UIFont systemFontOfSize:14];
    [self addSubview:label];
    return label;
}

@end
