//
//  POCModelResultado.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelResult.h"
#import "POCModelLink.h"
#import "NSObject+POCUtils.h"

@implementation POCModelResult

// This is the model that is created from the data contained in the value of the key "resultado" withing the JSON.
// Checks are made to avoid issues in this NSDictionary
+ (POCModelResult *) fromJSON:(NSDictionary*)data
{
    POCModelResult *resultadoModel = [[POCModelResult alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        // Concerning the method getVerifiedString, please take a look at the file NSObject+POCUtils.h
        resultadoModel.titulo = [NSObject getVerifiedString:[data objectForKey:@"titulo"]];
        resultadoModel.subtitulo = [NSObject getVerifiedString:[data objectForKey:@"subtitulo"]];
        resultadoModel.slug = [NSObject getVerifiedString:[data objectForKey:@"slug"]];
        resultadoModel.data_disponibilizacao = [NSObject getVerifiedString:[data objectForKey:@"data_disponibilizacao"]];
        resultadoModel.recurso_url = [NSObject getVerifiedString:[data objectForKey:@"recurso_url"]];
        
        resultadoModel.imagem = [POCModelImage fromJSON:[data objectForKey:@"imagem"]];
        resultadoModel.links = [POCModelLink fromJSONArray:[data objectForKey:@"links"]];
    }
    return resultadoModel;
}

// If multiple POCModelResult models have to be created from a array of dictionaries. This method will create another array containing the instantiated models.
+ (NSArray *) fromJSONArray:(NSArray*)data
{
    NSMutableArray *arrayResultados = [[NSMutableArray alloc] init];
    
    if (data && [data isKindOfClass:[NSArray class]] && [data count] > 0)
    {
        for (id object in data)
        {
            if (object && [object isKindOfClass:[NSDictionary class]])
            {
                [arrayResultados addObject:[self fromJSON:object]];
            }
        }
    }
    return arrayResultados;
}

@end