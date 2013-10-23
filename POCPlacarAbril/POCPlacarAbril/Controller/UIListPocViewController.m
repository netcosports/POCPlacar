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
    
    // When the user click on an article, it launches safari, but he comes back in the application the data has to be refreshed. The notification "refreshArticles" is launched in "AppDelegate.m" and it is handled in this controller by the method "-(void)refresh". This controller becomes an observer for the NSNotificationCenter.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:@"refreshArticles" object:nil];
    
    [self setUpList];
    [self loadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
// In the method "-(void)viewDidLoad" we specified that this controller is an observer of the NSNotificationCenter to let him receive notifications. It has to be removed from the observers right here.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// This method is creating the refresh button on the right top corner of the screen.
-(void)setRefreshButtonItem
{
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Refresh", @"") style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = refreshButton;
}

// This method is starting the loading spinner on the right top corner of the screen.
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

// The Controller asks the manager to get the data to load in the list. When the data are retrieved, the block is launched and it checks the validity of it before the integration inside the list.
-(void)loadData
{
    [self setLoadingItem];
    
    [POCManager getArticlesPerChampionship:^(POCModelArticlesChampionship *rep, BOOL success)
    {
        // If the data are reliable, the controller keep a pointer on it (data_list) to provide it to the cells later.
        if (rep)
        {
            data_list = nil;
            data_list = rep.resultado;
                if (data_list)
                    [self.tb_list reloadData];
        }
        // However, if the data seem to be incorrect, a pop up shows that something went wrong while they were retrieved from the Placar - API.
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Warning", @"") message:NSLocalizedString(@"Something went wront while attempting to retrieve information from the Placar - API", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil];
            [alert show];
        }
        [self setRefreshButtonItem];
    }];
}

#pragma UITableViewDelegate

// The number of cells to display in the list has to match the number of items in the data. This amount is provided to list right here.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!data_list)
        return 0;
    else
        return [data_list count];
}

// Here is the construction of each cell (UITableViewCell)  of the list.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CellArticle";
    
    CellArticle *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CellArticle" owner:self options:nil] objectAtIndex:0];
        
    }
    // The data to display are provided to the cell right here. Some verifications are made before to be sure that the correct data are send to the right cell.
    if (data_list && [data_list count] > indexPath.row && [data_list objectAtIndex:indexPath.row])
    {
        [cell myInit:[data_list objectAtIndex:indexPath.row]];
    }
    return cell;
}

// When the user click on a cell, described by its index (NSIndexPath) of the displayed list (UITableView) it launches the default web browser of the iphone with the url provided in each article of the data.
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

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
