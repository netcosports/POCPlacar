//
//  UIListPocViewController.m
//  POCPlacarAbril
//
//  Created by Derivery Guillaume on 10/22/13.
//  Copyright (c) 2013 NetcoSports. All rights reserved.
//

#import "UIListPocViewController.h"
#import "POCManager.h"
#import "CellArticle.h"

@implementation UIListPocViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    { }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"Articles per championship", @"")];
    [self setUpList];
    [self loadData];
}

-(void)setRefreshButtonItem
{
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = refreshButton;
}

-(void)setLoadingItem
{
    UIActivityIndicatorView *activity_loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activity_loading startAnimating];
    UIBarButtonItem *loadingItem = [[UIBarButtonItem alloc] initWithCustomView:activity_loading];
    
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = loadingItem;
}

-(void)setUpList
{
    [self.tb_list setDelegate:self];
    [self.tb_list setDataSource:self];
}

-(void)refresh
{
    [self loadData];
}

-(void)loadData
{
    [self setLoadingItem];
    [POCManager getArticlesPerChampionship:^(POCModelArticlesChampionship *rep, BOOL success) {
        if (rep)
        {
            data_list = nil;
            data_list = rep.resultado;
                if (data_list)
                {
                    [self.tb_list reloadData];
                    [self setRefreshButtonItem];
                }
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Warning", @"") message:NSLocalizedString(@"Something went wront while attempting to retrieve information from the Placar - API", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil];
            [alert show];
        }
    }];
}

#pragma UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!data_list)
        return 0;
    else
        return [data_list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CellArticle";
    
    CellArticle *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CellArticle" owner:self options:nil] objectAtIndex:0];
        
    }
    if (data_list && [data_list count] > indexPath.row && [data_list objectAtIndex:indexPath.row])
    {
        [cell myInit:[data_list objectAtIndex:indexPath.row]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (data_list && [data_list count] > indexPath.row && [data_list objectAtIndex:indexPath.row])
    {
        POCModelResult *resultSelected = [data_list objectAtIndex:indexPath.row];
        NSURL *urlArticle = [NSURL URLWithString:resultSelected.recurso_url];
        [[UIApplication sharedApplication] openURL:urlArticle];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
