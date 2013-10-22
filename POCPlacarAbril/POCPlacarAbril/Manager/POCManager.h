//
//  POCManager.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POCModelArticlesChampionship.h"

@interface POCManager : NSObject

+(void)getArticlesPerChampionship:(void(^)(POCModelArticlesChampionship *rep, BOOL success))cb_rep_;

@end
