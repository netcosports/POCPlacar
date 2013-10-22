#import <UIKit/UIKit.h>
#import "POCModelResult.h"

@interface CellArticle : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UILabel *lb_date;
@property (weak, nonatomic) IBOutlet UIImageView *img_article;

-(void)myInit:(POCModelResult *)modelResult_;

@end
