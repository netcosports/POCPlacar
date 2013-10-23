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

// This is the main method of the POCRequester. It uses the AFNetworking library to create the web connection, launch the request and serialize the data.
+(void)requestPlacarAPI:(NSString *)url_ cb_rep:(void(^)(NSDictionary *rep, BOOL success))cb_rep_
{
    AFHTTPRequestOperationManager *afNetworkingManager = [AFHTTPRequestOperationManager manager];
    
    NSURL* urlToRequester = [NSURL URLWithString:url_];
    NSLog(@"URL => %@", urlToRequester);
    
    // In this case it uses a custom NSURLRequest to be able to integrate the specific HTTP header field to connect the Placar API. HEADER_TOKEN_KEY and HEADER_TOKEN_VALUE describe the key and the value used by this API andincluded in the header of each request.
    // A timeout in set to 60seconds (setTimeoutInterval:60), if the request takes longer than this time to get the data, a timeout error is launched.
    // The no cache policy is employed (setCachePolicy:NSURLRequestReloadIgnoringCacheData). It means that the application cache is not used to get the data.
    NSMutableURLRequest * pocRequest = [[NSMutableURLRequest alloc] initWithURL:urlToRequester];
    [pocRequest setTimeoutInterval:60];
    [pocRequest setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [pocRequest setHTTPMethod:@"GET"];
    [pocRequest addValue:HEADER_TOKEN_VALUE forHTTPHeaderField:HEADER_TOKEN_KEY];

    // AFHTTPRequestOperationManager is creating an operation (which the http request) here.
    AFHTTPRequestOperation *afNetworkingOperation = [afNetworkingManager HTTPRequestOperationWithRequest:pocRequest success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        // If everything went well during this operation, the serialized data are stored in responseObject and they are accessible right here.
        
        NSLog(@"RESPONSE => %@", responseObject);
        cb_rep_(responseObject, true);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        // If something went wrong during the operation, this block is called and an error (NSError) is provided to describe what failed.
        NSLog(@"ERROR => %@", error);
        cb_rep_([error userInfo], false);
    }];
    [afNetworkingManager.operationQueue addOperation:afNetworkingOperation];
}

@end
