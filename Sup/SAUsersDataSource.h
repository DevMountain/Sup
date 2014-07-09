//
//  SAUsersDataSource.h
//  Sup
//
//  Created by Joshua Howland on 7/9/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAUsersDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong, readonly) UITableView *tableView;

+ (SAUsersDataSource *)sharedInstance;

- (void)setTableView:(UITableView *)tableView;

@end
