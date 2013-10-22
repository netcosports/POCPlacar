//
//  POCModelLink.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelLink.h"

@implementation POCModelLink

+ (POCModelLink *) fromJSON:(NSDictionary*)data
{
    POCModelLink *linkModel = [[POCModelLink alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        id href = [data objectForKey:@"href"];
        if (href != nil && [href isKindOfClass:[NSString class]])
            linkModel.href = href;
        else
            linkModel.href = @"";

        id rel = [data objectForKey:@"rel"];
        if (rel != nil && [rel isKindOfClass:[NSString class]])
            linkModel.rel = rel;
        else
            linkModel.rel = @"";

        id type = [data objectForKey:@"type"];
        if (type != nil && [type isKindOfClass:[NSString class]])
            linkModel.type = type;
        else
            linkModel.type = @"";
    }
    return linkModel;
}

+ (NSArray *) fromJSONArray:(NSArray*)data
{
    NSMutableArray *arrayLinks = [[NSMutableArray alloc] init];
    
    if (data && [data isKindOfClass:[NSArray class]] && [data count] > 0)
    {
        for (id object in data)
        {
            if (object && [object isKindOfClass:[NSDictionary class]])
            {
                [arrayLinks addObject:[self fromJSON:object]];
            }
        }
    }
    return arrayLinks;
}

@end
