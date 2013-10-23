//
//  POCModelLink.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelLink.h"
#import "NSObject+POCUtils.h"

@implementation POCModelLink

// This is the model that is created from the data contained in the value of the key "links" withing the JSON.
// Checks are made to avoid issues in this NSDictionary
+ (POCModelLink *) fromJSON:(NSDictionary*)data
{
    POCModelLink *linkModel = [[POCModelLink alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        linkModel.href = [NSObject getVerifiedString:[data objectForKey:@"href"]];
        linkModel.rel = [NSObject getVerifiedString:[data objectForKey:@"rel"]];
        linkModel.type = [NSObject getVerifiedString:[data objectForKey:@"type"]];
    }
    return linkModel;
}

// If multiple POCModelLink models have to be created from a array of dictionaries. This method will create another array containing the instantiated models.
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
