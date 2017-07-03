//
//  WeatherData.h
//  Storm
//
//  Created by Xingyuan Wang on 7/3/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WeatherData : NSObject

@property (nonatomic) NSInteger temperature;
@property (nonatomic) NSInteger humidity;
@property (nonatomic) CGFloat windSpeed;
@property (nonatomic) NSInteger windAngle;
@property (nonatomic, copy) NSString *shortCondition;
@property (nonatomic, copy) NSString *longCondition;
@property (nonatomic, copy) NSString *iconName;

@end
