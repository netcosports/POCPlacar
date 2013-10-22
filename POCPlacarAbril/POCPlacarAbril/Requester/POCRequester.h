//
//  POCRequester.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface POCRequester : NSObject

+(void)requestPlacarAPI:(NSString *)url_ cb_rep:(void(^)(NSDictionary *rep, BOOL success))cb_rep_;

@end
