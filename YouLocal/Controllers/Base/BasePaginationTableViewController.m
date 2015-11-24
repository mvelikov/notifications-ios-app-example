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

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(layoutMargins)]) {
        self.tableView.layoutMargins = UIEdgeInsetsZero;
    }

    [self.view addSubview:self.tableView];
}
- (void) preloadItems {
    [NSException raise:@"- (void) preloadItems not implemented in child class" format:@""];
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
    
    if ([cell respondsToSelector:@selector(layoutMargins)]) {
        cell.layoutMargins = UIEdgeInsetsZero;
    }
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityIndicator.tag = kLoadingCellActivityIndicatorTag;
    
    
    [cell addSubview:activityIndicator];
    
    [activityIndicator setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *centerYConstraint =
    [NSLayoutConstraint constraintWithItem:activityIndicator
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:cell
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0.0];
    [cell addConstraint:centerYConstraint];
    
    // Center Horizontally
    NSLayoutConstraint *centerXConstraint =
    [NSLayoutConstraint constraintWithItem:activityIndicator
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:cell
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0.0];
    [cell addConstraint:centerXConstraint];
    
    NSLayoutConstraint *heightConstraint =
    [NSLayoutConstraint constraintWithItem:activityIndicator
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:64.0];
    [activityIndicator addConstraint:heightConstraint];
    
    NSLayoutConstraint *widthConstraint =
    [NSLayoutConstraint constraintWithItem:activityIndicator
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:64.0];
    [activityIndicator addConstraint:widthConstraint];
    
    [activityIndicator startAnimating];
    
    cell.tag = kLoadingCellTag;

    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath row] < [_items count]) {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier   forIndexPath:indexPath] ;
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = @"Hello";
        return cell;
    } else {
        return [self tableView:tableView loadingCellForRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (cell.tag == kLoadingCellTag) {

        [self preloadItems];
    }
}

@end
