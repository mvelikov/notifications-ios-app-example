//
//  BasePaginationTableViewController.m
//  Mapa.bg
//
//  Created by Mihail Velikov on 1/17/15.
//  Copyright (c) 2015 Mapa.bg. All rights reserved.
//

#import "BasePaginationTableViewController.h"

@interface BasePaginationTableViewController ()

@end

@implementation BasePaginationTableViewController

- (void) preloadItems {
    [NSException raise:@"- (void) preloadItems not implemented in child class" format:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_currentPage == 0) {
        return 1;
    }
    
    if (_currentPage < _pages) {
        return [_items count] + 1;
    }
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView loadingCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:nil];
    
    UIActivityIndicatorView *activityIndicator =
    [[UIActivityIndicatorView alloc]
     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = cell.center;
    
    activityIndicator.tag = kLoadingCellActivityIndicatorTag;
    
    [cell addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
    
    cell.tag = kLoadingCellTag;
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath row] < [_items count]) {
        [NSException raise:@"- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath not implemented in child class" format:nil];
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    } else {
        return [self tableView:tableView loadingCellForRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (cell.tag == kLoadingCellTag) {

        [self preloadItems];
    }
}

@end
