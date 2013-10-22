//
//  POCModelImagem.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelImage.h"

@implementation POCModelImage

+ (id) fromJSON:(NSDictionary*)data
{
    POCModelImage *imageModel = [[POCModelImage alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        if ([data objectForKey:@"descricaco"] != nil)
            imageModel.descricaco = [data objectForKey:@"descricaco"];
        else
            imageModel.descricaco = @"";
        
        if ([data objectForKey:@"original"] != nil)
            imageModel.original = [data objectForKey:@"original"];
        else
            imageModel.original = @"";
        
        if ([data objectForKey:@"url_template"] != nil)
            imageModel.url_template = [data objectForKey:@"url_template"];
        else
            imageModel.url_template = @"";
    }
    return imageModel;
}

+ (id) fromJSONArray:(NSArray*)data
{
    NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
    
    if (data && [data isKindOfClass:[NSArray class]] && [data count] > 0)
    {
        for (id object in data)
        {
            if (object && [object isKindOfClass:[NSDictionary class]])
            {
                [arrayImages addObject:[self fromJSON:object]];
            }
        }
    }
    return arrayImages;
}

@end
