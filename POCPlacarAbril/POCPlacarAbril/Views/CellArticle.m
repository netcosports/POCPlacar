#import "CellArticle.h"

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
    }
}

@end

