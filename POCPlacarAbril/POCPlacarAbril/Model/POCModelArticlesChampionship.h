//
//  POCModelArticlesChampionship.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModel.h"

@interface POCModelArticlesChampionship : POCModel

@property (strong, nonatomic) NSString *titulo;
@property (assign, nonatomic) int total_resultados;
@property (assign, nonatomic) int itens_por_pagina;
@property (assign, nonatomic) int pagina_actual;

@property (strong, nonatomic) NSArray *resultado;
@property (strong, nonatomic) NSArray *links;

+ (id) fromJSON:(NSDictionary*)data;
+ (id) fromJSONArray:(NSArray*)data;

@end
