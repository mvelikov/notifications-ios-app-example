//
//  User.h
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) NSString *userId, *gender, *fullName, *avatar50, *avatar;

- (id) initWithUserId: (NSString *) userId
               gender: (NSString *) gender
             fullName: (NSString *) fullName
             avatar50: (NSString *) avatar50
            andAvatar: (NSString *) avatar;
@end
