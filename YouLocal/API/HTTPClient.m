//
//  HTTPClient.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#define kNotificationsURL @"https://www.youlocalapp.com/api/notifications/load/?largeScreen&token=f2908658dc92d32a491d2e5b30aad86e"
#import "HTTPClient.h"

@implementation HTTPClient

- (id) init {
    if (self = [super init]) {
        manager = [AFHTTPRequestOperationManager manager];
        [manager.requestSerializer setTimeoutInterval:10];
    }
    
    return self;
}

- (void) loadNotifications {
    [manager GET:kNotificationsURL
      parameters:@{}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             id <HTTPClientDelegate> strongDelegate = self.delegate;
             
             if ([strongDelegate respondsToSelector:@selector(notificationsSuccessfullyLoadedWithResponse:)]) {
                 [strongDelegate notificationsSuccessfullyLoadedWithResponse:responseObject];
             }
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             id <HTTPClientDelegate> strongDelegate = self.delegate;
             
             if ([strongDelegate respondsToSelector:@selector(notificationsFailedWithError:)]) {
                 [strongDelegate notificationsFailedWithError:error];
             }
         }];
}
@end
