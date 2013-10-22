//
//  POCManager.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "POCManager.h"
#import "POCRequester.h"

@implementation POCManager

+(void)getArticlesPerChampionship:(void(^)(POCModelArticlesChampionship *rep, BOOL success))cb_rep_;
{
    NSString *url = POC_URL;
    
    [POCRequester requestPlacarAPI:[NSString stringWithFormat:@"%@%@", POC_HOST, url]  cb_rep:^(NSDictionary *rep, BOOL success)
    {
        if (rep && success)
        {
            cb_rep_([POCModelArticlesChampionship fromJSON:rep], success);
        }
        else
        {
            cb_rep_(nil, false);
        }
    }];
}

@end
