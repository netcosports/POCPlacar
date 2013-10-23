//
//  POCModelImagem.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelImage.h"
#import "NSObject+POCUtils.h"

@implementation POCModelImage

// This is the model that is created from the data contained in the value of the key "imagem" withing the JSON.
// Checks are made to avoid issues in this NSDictionary
+ (POCModelImage *) fromJSON:(NSDictionary*)data
{
    POCModelImage *imageModel = [[POCModelImage alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        imageModel.descricaco = [NSObject getVerifiedString:[data objectForKey:@"descricaco"]];
        imageModel.original = [NSObject getVerifiedString:[data objectForKey:@"original"]];
        imageModel.url_template = [NSObject getVerifiedString:[data objectForKey:@"url_template"]];
    }
    return imageModel;
}

// If multiple POCModelImage models have to be created from a array of dictionaries. This method will create another array containing the instantiated models.
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
