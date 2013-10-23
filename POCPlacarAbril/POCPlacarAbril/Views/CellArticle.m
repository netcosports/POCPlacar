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

// The text for the labels displayed within the cell are provided by the POCModelResult created earlier. This method assigns the data of the model to the right labels and to the image of the cell before checking the integrity of this model.
-(void)myInit:(POCModelResult *)modelResult_
{
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    if (modelResult_ && [modelResult_ isKindOfClass:[POCModelResult class]])
    {
        [self.lb_title setText:modelResult_.titulo];
        [self.lb_date setText:modelResult_.data_disponibilizacao];
        
        // The url of the image to display is provided to the UIImageView. The methode "setImageWithURL" is in charge of downloading the content of the image before displaying it.
        // This method is including in the library called AFNetworking. (cf Readme.txt for further information)
        [self.img_article setImageWithURL:[NSURL URLWithString:modelResult_.imagem.original] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    }
}

@end

