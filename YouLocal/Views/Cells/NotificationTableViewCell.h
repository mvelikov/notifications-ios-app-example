//
//  UINotificationTableViewCell.h
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationTableViewCell : UITableViewCell

@property (nonatomic, weak) UIImageView *avatarImage;
@property (nonatomic, weak) UIImageView *typeImage;
@property (nonatomic, weak) UILabel *authorNameLabel;
@property (nonatomic, weak) UILabel *createdBeforeLabel;
@property (nonatomic, weak) UILabel *messageLabel;

@end
