//
//  SAUsersViewController.m
//  Sup
//
//  Created by Joshua Howland on 7/9/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "SAUsersViewController.h"
#import "SAUsersDataSource.h"

#import <Parse/Parse.h>


@interface SAUsersViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SAUsersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];;
    self.tableView.dataSource = [SAUsersDataSource sharedInstance];
    self.tableView.delegate = self;
    
    [[SAUsersDataSource sharedInstance] setTableView:self.tableView];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
