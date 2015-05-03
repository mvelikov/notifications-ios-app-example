//
//  Notification.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import "Notification.h"

@implementation Notification

-(id) init {
    if (self = [super init]) {
        _user = [[User alloc] init];
        _type = @"";
        _message = @"";
        _createdAt = [NSDate date];
    }
    
    return self;
}

-(id) initWithUser: (User *) user
              type: (NSString *) type
           message: (NSString *) message
           andDate: (NSDate *) date {
    if ([self init]) {
        _user = user;
        _type = type;
        _message = message;
        _createdAt = date;
    }
    
    return self;
}

-(NSURL *) imageURL {
    return [NSURL URLWithString:[_user avatar]];
}

-(NSString *) author {
    return [_user fullName];
}

@end
