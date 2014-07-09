//
//  SAUsersDataSource.m
//  Sup
//
//  Created by Joshua Howland on 7/9/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "SAUsersDataSource.h"
#import <Parse/Parse.h>

@interface SAUsersDataSource ()

@property (nonatomic, strong) NSArray *users;

@end

@implementation SAUsersDataSource

+ (SAUsersDataSource *)sharedInstance {
    static SAUsersDataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SAUsersDataSource new];
        [sharedInstance reloadUsers];
    });
    return sharedInstance;
}

- (void)reloadUsers {

    PFQuery *query = [PFUser query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        self.users = objects;
        [_tableView reloadData];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell"];

    if (!cell) {
        cell = [UITableViewCell new];
    }
    
    PFUser *user = self.users[indexPath.row];
    cell.textLabel.text = user.username;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Send Sup to someone now!";
}

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
}

@end
