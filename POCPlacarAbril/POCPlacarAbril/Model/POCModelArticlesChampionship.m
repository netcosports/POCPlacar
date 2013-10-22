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

+ (id) fromJSON:(NSDictionary*)data
{
    POCModelArticlesChampionship *articlesPerChampionshipModel = [[POCModelArticlesChampionship alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        if ([data objectForKey:@"titulo"] != nil)
            articlesPerChampionshipModel.titulo = [data objectForKey:@"titulo"];
        else
            articlesPerChampionshipModel.titulo = @"";

        if ([data objectForKey:@"total_resultados"] != nil)
            articlesPerChampionshipModel.total_resultados = [[data objectForKey:@"total_resultados"] integerValue];
        else
            articlesPerChampionshipModel.total_resultados = 0;

        if ([data objectForKey:@"itens_por_pagina"] != nil)
            articlesPerChampionshipModel.itens_por_pagina = [[data objectForKey:@"itens_por_pagina"] integerValue];
        else
            articlesPerChampionshipModel.itens_por_pagina = 0;
        
        if ([data objectForKey:@"pagina_actual"] != nil)
            articlesPerChampionshipModel.pagina_actual = [[data objectForKey:@"pagina_actual"] integerValue];
        else
            articlesPerChampionshipModel.pagina_actual = 0;
        
        if ([data objectForKey:@"resultado"] != nil)
            articlesPerChampionshipModel.resultado = [POCModelResult fromJSONArray:[data objectForKey:@"resultado"]];
        else
            articlesPerChampionshipModel.resultado = @[];
        
        if ([data objectForKey:@"links"] != nil)
            articlesPerChampionshipModel.links = [POCModelLink fromJSONArray:[data objectForKey:@"links"]];
        else
            articlesPerChampionshipModel.links = @[];
    }
    
    return articlesPerChampionshipModel;
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
