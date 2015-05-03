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

@interface LibraryAPI : NSObject <HTTPClientDelegate> {
    @protected PersistencyManager *persistencyManager;
    @protected HTTPClient *httpClient;
}

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

@end
