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

// This method of the POCManager creates the url to call. It is composed by the POC_HOST and the POC_URL (cf POCPlacarAbril-Prefix.pch). Then, it calls the POCRequester with this URL.
+(void)getArticlesPerChampionship:(void(^)(POCModelArticlesChampionship *rep, BOOL success))cb_rep_;
{
    [POCRequester requestPlacarAPI:[NSString stringWithFormat:@"%@%@", POC_HOST, POC_URL]  cb_rep:^(NSDictionary *rep, BOOL success)
    {
        if (rep && success)
        {
            // Once the requester has returned the data composed of Dictionaries, Arrays, Strings ... It creates a new model (in this case, it is a POCModelArticlesChampionship) from the main Dictionnarie containing all the data.
            cb_rep_([POCModelArticlesChampionship fromJSON:rep], success);
        }
        else
        {
            cb_rep_(nil, false);
        }
    }];
}

@end
