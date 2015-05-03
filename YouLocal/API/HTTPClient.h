//
//  HTTPClient.h
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@protocol HTTPClientDelegate;

@interface HTTPClient : NSObject {
    @protected AFHTTPRequestOperationManager *manager;
}
@property (nonatomic, weak) id <HTTPClientDelegate> delegate;

- (void) loadNotifications;

@end

@protocol HTTPClientDelegate <NSObject>

- (void) notificationsSuccessfullyLoadedWithResponse:(id) response;
- (void) notificationsFailedWithError: (NSError *) error;
@end
