//
//  POCRequester.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCRequester.h"
#import "AFNetworking.h"

@implementation POCRequester

+(void)requestPlacarAPI:(NSString *)url_ cb_rep:(void(^)(NSDictionary *rep, BOOL success))cb_rep_
{
    AFHTTPRequestOperationManager *afNetworkingManager = [AFHTTPRequestOperationManager manager];
    
    NSURL* urlToRequester = [NSURL URLWithString:url_];
    NSLog(@"URL => %@", urlToRequester);
    
    NSMutableURLRequest * pocRequest = [[NSMutableURLRequest alloc] initWithURL:urlToRequester];
    [pocRequest setHTTPMethod:@"GET"];
    [pocRequest addValue:HEADER_TOKEN_VALUE forHTTPHeaderField:HEADER_TOKEN_KEY];
    
//    pocRequest = [[afNetworkingManager.requestSerializer requestBySerializingRequest:pocRequest withParameters:nil error:nil] mutableCopy];
    
    AFHTTPRequestOperation *afNetworkingOperation = [afNetworkingManager HTTPRequestOperationWithRequest:pocRequest success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"RESPONSE => %@", responseObject);
        cb_rep_(responseObject, true);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"ERROR => %@", error);
        cb_rep_([error userInfo], false);
    }];
    [afNetworkingManager.operationQueue addOperation:afNetworkingOperation];
}

@end
