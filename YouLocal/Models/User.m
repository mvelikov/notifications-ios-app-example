//
//  User.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import "User.h"

@implementation User

- (id) init {
    if (self = [super init]) {
        _avatar = @"";
        _avatar50 = @"";
        _fullName = @"";
        _gender = @"";
        _userId = @"";
    }
    
    return self;
}

- (id) initWithUserId: (NSString *) userId
               gender: (NSString *) gender
             fullName: (NSString *) fullName
             avatar50: (NSString *) avatar50
            andAvatar: (NSString *) avatar {
    if ([self init]) {
        _avatar50 = avatar50;
        _avatar = avatar;
        _fullName = fullName;
        _gender = gender;
        _fullName = fullName;
    }
    
    return self;
}
@end
