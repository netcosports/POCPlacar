//
//  POCModelImagem.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModel.h"

@interface POCModelImage : POCModel

@property (strong, nonatomic) NSString *descricaco;
@property (strong, nonatomic) NSString *original;
@property (strong, nonatomic) NSString *url_template;

+ (id) fromJSON:(NSDictionary*)data;
+ (id) fromJSONArray:(NSArray*)data;

@end
