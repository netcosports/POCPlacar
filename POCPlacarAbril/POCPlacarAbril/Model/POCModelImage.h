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

+ (POCModelImage *) fromJSON:(NSDictionary*)data;
+ (NSArray *) fromJSONArray:(NSArray*)data;

@end
