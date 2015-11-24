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
        _beforeSign = @"";
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
        
        _beforeSign = [self createdBeforeSign];
    }
    
    return self;
}

-(NSURL *) imageURL {
    return [NSURL URLWithString:[_user avatar]];
}

-(NSString *) author {
    return [_user fullName];
}

-(NSInteger) createdBeforeLabel {
    NSDate *now = [NSDate date];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
                                                        fromDate:_createdAt
                                                          toDate:now
                                                         options:NSCalendarWrapComponents];
    NSInteger difference = [components day];
    _beforeSign = @"d";
    
    if (difference == 0) {
        components = [gregorianCalendar components:NSCalendarUnitHour
                                          fromDate:_createdAt
                                            toDate:now
                                           options:NSCalendarWrapComponents];
        
        difference = [components hour];
        _beforeSign = @"h";
        
        if (difference == 0) {
            components = [gregorianCalendar components:NSCalendarUnitMinute
                                              fromDate:_createdAt
                                                toDate:now
                                               options:NSCalendarWrapComponents];
            
            difference = [components minute];
            _beforeSign = @"m";
        }
    }
    return difference;
}
-(NSString *) createdBeforeSign {
    if ([_beforeSign isEqualToString:@""]) {
        [self createdBeforeLabel];
    }
    return _beforeSign;
}
@end
