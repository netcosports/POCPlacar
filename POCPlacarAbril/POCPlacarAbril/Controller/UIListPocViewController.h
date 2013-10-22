//
//  UIListPocViewController.h
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIListPocViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *data_list;
}

@property (weak, nonatomic) IBOutlet UITableView *tb_list;

@end
