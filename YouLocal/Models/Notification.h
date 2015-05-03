//
//  Notification.h
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Notification : NSObject

@property (nonatomic) User *user;
@property (nonatomic, weak) NSURL *imageURL;
@property (nonatomic) NSDate *createdAt;
@property (nonatomic) NSString *type, *message, *author;

-(id) initWithUser: (User *) user
              type: (NSString *) type
           message: (NSString *) message
           andDate: (NSDate *) date;

@end
