//
//  SAViewController.m
//  Sup
//
//  Created by Joshua Howland on 7/9/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "SAViewController.h"
#import "SAUsersViewController.h"

#import <Parse/Parse.h>

@interface SAViewController () <UITableViewDelegate, PFSignUpViewControllerDelegate, PFLogInViewControllerDelegate>

@end

@implementation SAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([PFUser currentUser]) {
        [self loggedIn];
    }
    
}

- (void)loggedIn {
    
    SAUsersViewController *viewController = [SAUsersViewController new];
    [self.navigationController pushViewController:viewController animated:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signIn:(id)sender {
    
    PFLogInViewController *logInViewController = [PFLogInViewController new];
    logInViewController.delegate = self;
    [self presentViewController:logInViewController animated:YES completion:nil];
}

- (IBAction)signUp:(id)sender {
    PFSignUpViewController *signUpViewController = [PFSignUpViewController new];
    signUpViewController.delegate = self;
    [self presentViewController:signUpViewController animated:YES completion:nil];
}

- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    // store info here
    return YES;
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self loggedIn];
}

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // store info here
    return YES;
}

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self loggedIn];
}


@end
