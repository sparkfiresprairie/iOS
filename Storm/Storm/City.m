//
//  City.m
//  Storm
//
//  Created by Xingyuan Wang on 7/3/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithCityId:(NSString *)cityId andCityName:(NSString *)cityName
{
    self = [super init];
    if (self) {
        _cityId = cityId;
        _cityName = cityName;
    }
    return self;
}

@end
