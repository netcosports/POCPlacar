//
//  POCModelArticlesChampionship.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModelArticlesChampionship.h"
#import "POCModelResult.h"
#import "POCModelLink.h"

@implementation POCModelArticlesChampionship

+ (POCModelArticlesChampionship *) fromJSON:(NSDictionary*)data
{
    POCModelArticlesChampionship *articlesPerChampionshipModel = [[POCModelArticlesChampionship alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        id titulo = [data objectForKey:@"titulo"];
        if (titulo != nil && [titulo isKindOfClass:[NSString class]])
            articlesPerChampionshipModel.titulo = titulo;
        else
            articlesPerChampionshipModel.titulo = @"";

        id total_resultados = [data objectForKey:@"total_resultados"];
        if (total_resultados != nil && [total_resultados isKindOfClass:[NSNumber class]])
            articlesPerChampionshipModel.total_resultados = [total_resultados intValue];
        else
            articlesPerChampionshipModel.total_resultados = 0;

        
        id itens_por_pagina = [data objectForKey:@"itens_por_pagina"];
        if (itens_por_pagina != nil && [itens_por_pagina isKindOfClass:[NSNumber class]])
            articlesPerChampionshipModel.itens_por_pagina = [itens_por_pagina intValue];
        else
            articlesPerChampionshipModel.itens_por_pagina = 0;
        
        id pagina_actual = [data objectForKey:@"pagina_actual"];
        if (pagina_actual != nil && [pagina_actual isKindOfClass:[NSNumber class]])
            articlesPerChampionshipModel.pagina_actual = [pagina_actual intValue];
        else
            articlesPerChampionshipModel.pagina_actual = 0;
        
        articlesPerChampionshipModel.resultado = [POCModelResult fromJSONArray:[data objectForKey:@"resultado"]];

        articlesPerChampionshipModel.links = [POCModelLink fromJSONArray:[data objectForKey:@"links"]];
    }
    return articlesPerChampionshipModel;
}

+ (NSArray *) fromJSONArray:(NSArray*)data
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
