//
//  CellArticle.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POCModelResult.h"

@interface CellArticle : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UILabel *lb_date;
@property (weak, nonatomic) IBOutlet UIImageView *img_article;

-(void)myInit:(POCModelResult *)modelResult_;

@end
