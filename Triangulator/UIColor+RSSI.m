//
//  UIColor+RSSI.m
//  Triangulator
//
//  Created by Zeke Shearer on 3/16/15.
//  Copyright (c) 2015 Zeke Shearer. All rights reserved.
//

#import "UIColor+RSSI.h"

@implementation UIColor (RSSI)

+ (UIColor *)colorWithRSSI:(NSInteger)RSSI
{
    return [UIColor colorWithRed:0 green:[self greenForRSSI:RSSI] blue:[self blueForRSSI:RSSI] alpha:1];
}

+ (CGFloat)greenForRSSI:(NSInteger)RSSI
{
    return 1;
}

+ (CGFloat)blueForRSSI:(NSInteger)RSSI
{
    return 1;
}

@end
