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
    POCModelImage *imagemModel = [[POCModelImage alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        if ([data objectForKey:@"descricaco"] != nil)
            imagemModel.descricaco = [data objectForKey:@"descricaco"];
        else
            imagemModel.descricaco = @"";
        
        if ([data objectForKey:@"original"] != nil)
            imagemModel.original = [data objectForKey:@"original"];
        else
            imagemModel.original = @"";
        
        if ([data objectForKey:@"url_template"] != nil)
            imagemModel.url_template = [data objectForKey:@"url_template"];
        else
            imagemModel.url_template = @"";
    }
    return imagemModel;
}

+ (id) fromJSONArray:(NSArray*)data
{
    NSMutableArray *arrayImagems = [[NSMutableArray alloc] init];
    
    if (data && [data isKindOfClass:[NSArray class]] && [data count] > 0)
    {
        for (id object in data)
        {
            if (object && [object isKindOfClass:[NSDictionary class]])
            {
                [arrayImagems addObject:[self fromJSON:object]];
            }
        }
    }
    return arrayImagems;
}

@end
