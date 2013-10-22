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

+ (POCModelResult *) fromJSON:(NSDictionary*)data
{
    POCModelResult *resultadoModel = [[POCModelResult alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        id titulo = [data objectForKey:@"titulo"];
        if (titulo != nil && [titulo isKindOfClass:[NSString class]])
            resultadoModel.titulo = titulo;
        else
            resultadoModel.titulo = @"";
        
        id subtitulo = [data objectForKey:@"subtitulo"];
        if (subtitulo != nil && [subtitulo isKindOfClass:[NSString class]])
            resultadoModel.subtitulo = subtitulo;
        else
            resultadoModel.subtitulo = @"";
        
        id slug = [data objectForKey:@"slug"];
        if (slug != nil && [slug isKindOfClass:[NSString class]])
            resultadoModel.slug = slug;
        else
            resultadoModel.slug = @"";

        id data_disponibilizacao = [data objectForKey:@"data_disponibilizacao"];
        if (data_disponibilizacao != nil && [data_disponibilizacao isKindOfClass:[NSString class]])
            resultadoModel.data_disponibilizacao = data_disponibilizacao;
        else
            resultadoModel.data_disponibilizacao = @"";
        
        id recurso_url = [data objectForKey:@"recurso_url"];
        if (recurso_url != nil && [recurso_url isKindOfClass:[NSString class]])
            resultadoModel.recurso_url = recurso_url;
        else
            resultadoModel.recurso_url = @"";
        
        resultadoModel.imagem = [POCModelImage fromJSON:[data objectForKey:@"imagem"]];
        
        resultadoModel.links = [POCModelLink fromJSONArray:[data objectForKey:@"links"]];
    }
    return resultadoModel;
}

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