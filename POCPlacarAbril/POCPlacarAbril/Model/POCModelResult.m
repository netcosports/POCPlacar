//
//  POCModelResultado.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelResult.h"
#import "POCModelLink.h"

@implementation POCModelResult

+ (id) fromJSON:(NSDictionary*)data
{
    POCModelResult *resultadoModel = [[POCModelResult alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        if ([data objectForKey:@"titulo"] != nil)
            resultadoModel.titulo = [data objectForKey:@"titulo"];
        else
            resultadoModel.titulo = @"";
        
        if ([data objectForKey:@"subtitulo"] != nil)
            resultadoModel.subtitulo = [data objectForKey:@"subtitulo"];
        else
            resultadoModel.subtitulo = @"";
        
        if ([data objectForKey:@"slug"] != nil)
            resultadoModel.slug = [data objectForKey:@"slug"];
        else
            resultadoModel.slug = @"";

        if ([data objectForKey:@"data_disponibilizacao"] != nil)
            resultadoModel.data_disponibilizacao = [data objectForKey:@"data_disponibilizacao"];
        else
            resultadoModel.data_disponibilizacao = @"";
        
        if ([data objectForKey:@"recurso_url"] != nil)
            resultadoModel.recurso_url = [data objectForKey:@"recurso_url"];
        else
            resultadoModel.recurso_url = @"";
        
        if ([data objectForKey:@"imagem"] != nil)
            resultadoModel.imagem = [POCModelImage fromJSON:[data objectForKey:@"imagem"]];
        else
            resultadoModel.imagem = [[POCModelImage alloc]init];
        
        
        if ([data objectForKey:@"links"] != nil)
            resultadoModel.links = [POCModelLink fromJSONArray:[data objectForKey:@"links"]];
        else
            resultadoModel.links = @[];
    }
    
    return resultadoModel;
}

+ (id) fromJSONArray:(NSArray*)data
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