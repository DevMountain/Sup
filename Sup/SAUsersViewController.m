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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[SAUsersDataSource sharedInstance] reloadUsers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PFPush *push = [[PFPush alloc] init];
    [push setChannel:[[SAUsersDataSource sharedInstance] usernameAtIndex:indexPath]];
    [push setMessage:@"Sup"];
    [push sendPushInBackground];
    
}

@end
