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
#import "NSObject+POCUtils.h"

@implementation POCModelArticlesChampionship

// The main Model (POCModelArticlesChampionship) is created here from a checked NSDictionary representing the entire JSON container.
// If the parameter "data" is not reliable, and empty model is returned. But if it is correct, the keys used in the JSON container are used to retrieved strings and integers in the dictionary "data".
+ (POCModelArticlesChampionship *) fromJSON:(NSDictionary*)data
{
    POCModelArticlesChampionship *articlesPerChampionshipModel = [[POCModelArticlesChampionship alloc]init];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        // Concerning the different method getVerifiedString and getVerifiedInteger, please take a look at the file NSObject+POCUtils.h
        articlesPerChampionshipModel.titulo = [NSObject getVerifiedString:[data objectForKey:@"titulo"]];
        articlesPerChampionshipModel.total_resultados = [NSObject getVerifiedInteger:[data objectForKey:@"total_resultados"]];
        articlesPerChampionshipModel.itens_por_pagina = [NSObject getVerifiedInteger:[data objectForKey:@"itens_por_pagina"]];
        articlesPerChampionshipModel.pagina_actual = [NSObject getVerifiedInteger:[data objectForKey:@"pagina_actual"]];
        articlesPerChampionshipModel.resultado = [POCModelResult fromJSONArray:[data objectForKey:@"resultado"]];
        articlesPerChampionshipModel.links = [POCModelLink fromJSONArray:[data objectForKey:@"links"]];
    }
    return articlesPerChampionshipModel;
}

// If multiple POCModelArticlesChampionship models have to be created from a array of dictionaries. This method will create another array containing the instantiated models.
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
