//
//  LibraryAPI.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import "LibraryAPI.h"

@implementation LibraryAPI


- (id) init
{
    self = [super init];
    
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        httpClient = [[HTTPClient alloc] init];
        httpClient.delegate = self;
    }
    return self;
}

+ (LibraryAPI*) sharedInstance
{
    // 1
    static LibraryAPI *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}


- (NSArray *) getObjects {
    return [persistencyManager objects] ;
}

- (void) setObjectsFromArray: (NSArray*) array {
    [self clearObjects];
    [persistencyManager setObjectsFromArray:[array mutableCopy]];
}

- (void) addObject:(id)object {
    [persistencyManager addObject:object];
}

- (void) clearObjects {
    [persistencyManager clearObjects];
}

- (int) total {
    return [persistencyManager total];
}

- (int) perPage {
    return [persistencyManager perPage];
}

- (int) currentPage {
    return [persistencyManager currentPage];
}

- (int) lastPage {
    return [persistencyManager lastPage];
}

- (int) from {
    return [persistencyManager from];
}

- (int) to {
    return [persistencyManager to];
}

/**
 * This method is used in cases when system returns successful request
 * with 0 results
 */
- (void) setEmptyPersistencyManagerToStopPreloading {
    [persistencyManager setObjectsFromDictionary:@{
                                                   @"data" : [@[] mutableCopy],
                                                   @"total" : @0,
                                                   @"lastPage" : @0,
                                                   @"perPage" : @0,
                                                   @"currentPage": [NSString stringWithFormat:@"%d", 1],
                                                   @"from" : @0
                                                   }];
}

- (void) loadNotifications {
    [httpClient loadNotifications];
}

#pragma mark HTTPClientDelegate

- (void) notificationsSuccessfullyLoadedWithResponse:(id)response {
    NSString *isSuccessful = [response valueForKey:@"success"];
    
    if ([isSuccessful isEqualToString:@"success"]) {
        int i = 0;
        User *user;
        Notification *notification;
        NSMutableArray *notificationsList = [[NSMutableArray alloc] init];

        for (id tmpNotification in [response valueForKey:@"notifications"]) {
            if (++i >= 10) {
                break;
            }

            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            
            NSDate *tmpDate = [[NSDate alloc] init];
            tmpDate = [formatter dateFromString:[tmpNotification valueForKey:@"createdAt"]];
            user = [[User alloc] initWithUserId:[tmpNotification valueForKey:@"id"]
                                         gender:[tmpNotification valueForKey:@"gender"]
                                       fullName:[tmpNotification valueForKey:@"fullname"]
                                       avatar50:[tmpNotification valueForKey:@"avatar_50"]
                                      andAvatar:[tmpNotification valueForKey:@"avatar"]];
            
            
            notification = [[Notification alloc] initWithUser:user
                                                         type:[tmpNotification valueForKey:@"notificationType"]
                                                      message:[tmpNotification valueForKey:@"notificationTypeText"]
                                                      andDate:tmpDate];
            
            [notificationsList addObject:notification];
        }
        
        [persistencyManager setObjectsFromDictionary:@{
                                                       @"data" : notificationsList,
                                                       @"total" : @10,
                                                       @"lastPage" : @1,
                                                       @"perPage" : @10,
                                                       @"currentPage" : @1,
                                                       @"from" : @1
                                                       }];
    } else {
        [self setEmptyPersistencyManagerToStopPreloading];
    }
    id <LibraryAPIDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(notificationsSuccessfullyLoaded)]) {
        [strongDelegate notificationsSuccessfullyLoaded];
    }
}

- (void) notificationsFailedWithError:(NSError *)error {
    id <LibraryAPIDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(notificationsFailedWithError:)]) {
        [strongDelegate notificationsFailedWithError:error];
    }
}

@end
