//
//  POCUtils.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/23/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "NSObject+POCUtils.h"

// A category of NSObject (POCUtils) is created to facilitate the checks on the strings and integers received from the API before inserting them into the different models.
@implementation NSObject (POCUtils)

+(int) getVerifiedInteger:(id)data
{
    if (data != nil && [data isKindOfClass:[NSNumber class]])
        return [data intValue];
    
    else
        return 0;
}

+(NSString *) getVerifiedString:(id)data
{
    if (data != nil && [data isKindOfClass:[NSString class]])
        return data;
    
    else
        return @"";
}

@end
