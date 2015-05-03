//
//  BasePaginationTableViewController.h
//  Mapa.bg
//
//  Created by Mihail Velikov on 1/17/15.
//  Copyright (c) 2015 Mapa.bg. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kLoadingCellTag 123
#define kLoadingCellActivityIndicatorTag 123123

@interface BasePaginationTableViewController : UITableViewController

@property (nonatomic) NSUInteger currentPage, pages, totalItems, perPage;
@property (strong, nonatomic) NSMutableArray *items;

- (UITableViewCell *)tableView:(UITableView *)tableView loadingCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) preloadItems;

@end
