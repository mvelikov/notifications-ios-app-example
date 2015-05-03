//
//  LibraryAPI.h
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPClient.h"
#import "PersistencyManager.h"
#import "User.h"
#import "Notification.h"

@protocol LibraryAPIDelegate;

@interface LibraryAPI : NSObject <HTTPClientDelegate> {
    @protected PersistencyManager *persistencyManager;
    @protected HTTPClient *httpClient;
}

@property (weak, nonatomic) id <LibraryAPIDelegate> delegate;

+ (LibraryAPI*) sharedInstance;

- (NSArray *) getObjects;
- (void) setObjectsFromArray: (NSArray*) array;
- (void) clearObjects;
- (void) addObject: (id) object;

- (int) total;
- (int) perPage;
- (int) currentPage;
- (int) lastPage;
- (int) from;
- (int) to;

- (void) setEmptyPersistencyManagerToStopPreloading;

- (void) loadNotifications;

@end


@protocol LibraryAPIDelegate <NSObject>

- (void) notificationsFailedWithError:(NSError *) error;
- (void) notificationsSuccessfullyLoaded;

@end