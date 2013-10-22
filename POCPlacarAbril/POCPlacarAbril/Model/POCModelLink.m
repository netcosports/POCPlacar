//
//  POCModelLink.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelLink.h"

@implementation POCModelLink

+ (id) fromJSON:(NSDictionary*)data
{
    POCModelLink *linkModel = [[POCModelLink alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        if ([data objectForKey:@"href"] != nil)
            linkModel.href = [data objectForKey:@"href"];
        else
            linkModel.href = @"";
        
        if ([data objectForKey:@"rel"] != nil)
            linkModel.rel = [data objectForKey:@"rel"];
        else
            linkModel.rel = @"";
        
        if ([data objectForKey:@"type"] != nil)
            linkModel.type = [data objectForKey:@"type"];
        else
            linkModel.type = @"";
    }
    return linkModel;
}

+ (id) fromJSONArray:(NSArray*)data
{
    NSMutableArray *arrayArticles = [[NSMutableArray alloc] init];
    
    if (data && [data isKindOfClass:[NSArray class]] && [data count] > 0)
    {
        for (id object in data)
        {
            if (object && [object isKindOfClass:[NSDictionary class]])
            {
                [arrayArticles addObject:[self fromJSON:object]];
            }
        }
    }
    return arrayArticles;
}

@end
