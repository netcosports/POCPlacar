//
//  CellArticle.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "CellArticle.h"
#import "UIImageView+AFNetworking.h"

@implementation CellArticle

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    { }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)myInit:(POCModelResult *)modelResult_
{
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    if (modelResult_ && [modelResult_ isKindOfClass:[POCModelResult class]])
    {
        [self.lb_title setText:modelResult_.titulo];
        [self.lb_date setText:modelResult_.data_disponibilizacao];
        
        [self.img_article setImageWithURL:[NSURL URLWithString:modelResult_.imagem.original] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    }
}

@end

