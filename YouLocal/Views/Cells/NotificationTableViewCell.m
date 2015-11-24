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
        _avatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(8, 10, 80, 80)];
        [_avatarImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self.contentView addSubview:_avatarImage];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(96, 10, 46, 21)];
        [_nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_nameLabel];
        
        _typeImage = [[UIImageView alloc] initWithFrame:CGRectMake(96, 34, 32, 32)];
        [_typeImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_typeImage];
        
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(136, 39, 36, 21)];
        [_typeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_typeLabel];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(96, 68, 70, 21)];
        [_messageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_messageLabel];
        
        _createdBeforeSign = [[UILabel alloc] initWithFrame:CGRectMake(577, 10, 15, 21)];
        
        UIColor *createdBeforeTextColor = [UIColor colorWithRed:124/255.0
                                                          green:126/255.0
                                                           blue:136/255.0
                                                          alpha:1];
        
        [_createdBeforeLabel setTextColor:createdBeforeTextColor];
        [_createdBeforeSign setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_createdBeforeSign];
        
        _createdBeforeLabel = [[UILabel alloc] initWithFrame:CGRectMake(555, 10, 20, 21)];
        [_createdBeforeLabel setTextColor:createdBeforeTextColor];
        [_createdBeforeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_createdBeforeLabel];
        
        _timeImage = [[UIImageView alloc] initWithFrame:CGRectMake(521, 5, 32, 32)];
        [_timeImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:_timeImage];
    }
    
    return self;
}
@end
