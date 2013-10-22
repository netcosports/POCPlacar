//
//  POCModelImagem.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelImage.h"

@implementation POCModelImage

+ (POCModelImage *) fromJSON:(NSDictionary*)data
{
    POCModelImage *imageModel = [[POCModelImage alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        id descricaco = [data objectForKey:@"descricaco"];
        if (descricaco != nil && [descricaco isKindOfClass:[NSString class]])
            imageModel.descricaco = descricaco;
        else
            imageModel.descricaco = @"";
        
        id original = [data objectForKey:@"original"];
        if (original != nil && [original isKindOfClass:[NSString class]])
            imageModel.original = original;
        else
            imageModel.original = @"";
        
        id url_template = [data objectForKey:@"url_template"];
        if (url_template != nil && [url_template isKindOfClass:[NSString class]])
            imageModel.url_template = url_template;
        else
            imageModel.url_template = @"";
    }
    return imageModel;
}

+ (NSArray *) fromJSONArray:(NSArray*)data
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
