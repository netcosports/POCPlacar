//
//  POCModelResultado.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModel.h"
#import "POCModelImage.h"

@interface POCModelResult : POCModel

@property (strong, nonatomic) NSString *titulo;
@property (strong, nonatomic) NSString *subtitulo;
@property (strong, nonatomic) NSString *slug;
@property (strong, nonatomic) NSString *data_disponibilizacao;
@property (strong, nonatomic) NSString *recurso_url;

@property (strong, nonatomic) POCModelImage *imagem;
@property (strong, nonatomic) NSArray *links;

+ (POCModelResult *) fromJSON:(NSDictionary*)data;
+ (NSArray *) fromJSONArray:(NSArray*)data;

@end
