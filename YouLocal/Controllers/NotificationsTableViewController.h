//
//  NotificationsTableViewController.h
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePaginationTableViewController.h"
#import "LibraryAPI.h"
#import "NotificationTableViewCell.h"
#import "Notification.h"
#import "User.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NotificationsTableViewController : BasePaginationTableViewController <LibraryAPIDelegate>

@end
