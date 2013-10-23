//
//  POCUtils.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/23/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (POCUtils)

+(int) getVerifiedInteger:(id)data;
+(NSString *) getVerifiedString:(id)data;

@end
