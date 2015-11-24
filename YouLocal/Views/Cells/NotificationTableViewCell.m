//
//  UINotificationTableViewCell.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import "NotificationTableViewCell.h"

@implementation NotificationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _avatarImage = [[UIImageView alloc] init];
        [_avatarImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self.contentView addSubview:_avatarImage];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_avatarImage
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1.0
                                                                      constant:6.0]];

        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_avatarImage
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_avatarImage
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:31]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_avatarImage
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:31]];
        
        UIColor *blueNameColor = [UIColor colorWithRed:17/255.0f
                                                 green:107/255.0f
                                                  blue:201/255.0f
                                                 alpha:1],
        *lightBlueTypeColor = [UIColor colorWithRed:25/255.0f
                                             green:136/255.0f
                                              blue:173/255.0f
                                             alpha:1],
        *messageBlackColor = [UIColor colorWithRed:26/255.0f
                                             green:26/255.0f
                                              blue:26/255.0f
                                             alpha:1];
        
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setTextColor:blueNameColor];
        [_nameLabel setFont:[UIFont fontWithName:@"Lito-Bold"
                                            size:15]];
        [_nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_nameLabel];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_nameLabel
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_avatarImage
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1.0
                                                                      constant:11.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_nameLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTopMargin
                                                                    multiplier:1.0
                                                                      constant:2.0]];
        
        _typeImage = [[UIImageView alloc] init];
        [_typeImage setImage:[UIImage imageNamed:@"icon-notifications-large"]];
        [_typeImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_typeImage];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_typeImage
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_typeImage
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_avatarImage
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1.0
                                                                      constant:11.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_typeImage
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:16]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_typeImage
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:16]];
        
        _typeLabel = [[UILabel alloc] init];
        [_typeLabel setTextColor:lightBlueTypeColor];
        [_typeLabel setFont:[UIFont fontWithName:@"Lito-Regular"
                                            size:15]];
        [_typeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_typeLabel];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_typeLabel
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_typeImage
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1.0
                                                                      constant:8.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_typeLabel
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(96, 68, 70, 21)];
        [_messageLabel setTextColor:messageBlackColor];
        [_messageLabel setFont:[UIFont fontWithName:@"HelveticaNeue"
                                               size:14]];
        [_messageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_messageLabel];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_messageLabel
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeBottomMargin
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_messageLabel
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_avatarImage
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1.0
                                                                      constant:8.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_messageLabel
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTrailingMargin
                                                                    multiplier:1.0
                                                                      constant:8.0]];
        
        _createdBeforeSign = [[UILabel alloc] init];
        
        UIFont *createdFont = [UIFont fontWithName:@"Lito-Regular"
                                              size:12];
        UIColor *createdBeforeTextColor = [UIColor colorWithRed:124/255.0
                                                          green:126/255.0
                                                           blue:136/255.0
                                                          alpha:1];
        
        [_createdBeforeSign setTextColor:createdBeforeTextColor];
        [_createdBeforeSign setFont:createdFont];
        [_createdBeforeSign setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_createdBeforeSign];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_createdBeforeSign
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTrailingMargin
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_createdBeforeSign
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_nameLabel
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        
        _createdBeforeLabel = [[UILabel alloc] init];
        [_createdBeforeLabel setTextColor:createdBeforeTextColor];
        [_createdBeforeLabel setFont:createdFont];
        [_createdBeforeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_createdBeforeLabel];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_createdBeforeLabel
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_createdBeforeSign
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1.0
                                                                      constant:2.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_createdBeforeLabel
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_nameLabel
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        
        _timeImage = [[UIImageView alloc] init];
        [_timeImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_timeImage setImage:[UIImage imageNamed:@"icon-time"]];
        [self.contentView addSubview:_timeImage];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_timeImage
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_createdBeforeLabel
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1.0
                                                                      constant:2.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_timeImage
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:12]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_timeImage
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:12]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_timeImage
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_nameLabel
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_timeImage
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:_nameLabel
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1.0
                                                                      constant:8.0]];
        
    }
    
    return self;
}
@end
