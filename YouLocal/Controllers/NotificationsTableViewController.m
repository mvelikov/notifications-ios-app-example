//
//  NotificationsTableViewController.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import "NotificationsTableViewController.h"

@interface NotificationsTableViewController ()

@end

@implementation NotificationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Notifications";
    
    [[LibraryAPI sharedInstance] setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BasePagination class

- (void) preloadItems {
    [[LibraryAPI sharedInstance] loadNotifications];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath row] < [[self items] count]) {
        return [self tableView:tableView notificationCellForRowAtIndexPath:indexPath];
    } else {
        return [super tableView:tableView loadingCellForRowAtIndexPath:indexPath];
    }
}

#pragma mark - Table view data source



- (UITableViewCell *)tableView:(UITableView *)tableView notificationCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"notificationCell" forIndexPath:indexPath];
    
    Notification *notification = [[self items] objectAtIndex:indexPath.row];
    User *user = [notification user];
    
    [cell.avatarImage sd_setImageWithURL:[notification imageURL]];
    [cell.nameLabel setText:[user fullName]];
    [cell.typeLabel setText:[notification type]];
    [cell.messageLabel setText:[notification message]];
    
    return cell;
}

#pragma mark - LibraryAPI delegate

- (void) notificationsFailedWithError:(NSError *) error {
    self.title = @"Something Went Wrong";
}
- (void) notificationsSuccessfullyLoaded {
    LibraryAPI *library = [LibraryAPI sharedInstance];
    
    [self setItems:[[library getObjects] mutableCopy]];
    [self setCurrentPage:[library currentPage]];
    [self setPages:[library lastPage]];
    [self setTotalItems:[library total]];
    [self setPerPage:[library perPage]];
    
    [[self tableView] reloadData];
}

@end
