//
//  ForecastData.h
//  Storm
//
//  Created by Xingyuan Wang on 7/3/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastData : NSObject

@property (nonatomic) NSInteger maxDegree;
@property (nonatomic) NSInteger minDegree;
@property (nonatomic) NSInteger chancesOfRain;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, strong) NSDate *date;

@end
