//
//  POCModelLink.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCModel.h"

@interface POCModelLink : POCModel

@property (strong, nonatomic) NSString *href;
@property (strong, nonatomic) NSString *rel;
@property (strong, nonatomic) NSString *type;

+ (id) fromJSON:(NSDictionary*)data;
+ (id) fromJSONArray:(NSArray*)data;

@end
