//
//  UINotificationTableViewCell.h
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *avatarImage;
@property (strong, nonatomic) UIImageView *typeImage;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) UILabel *messageLabel;
@property (strong, nonatomic) UILabel *createdBeforeLabel;
@property (strong, nonatomic) UILabel *createdBeforeSign;
@property (strong, nonatomic) UIImageView *timeImage;
@end
