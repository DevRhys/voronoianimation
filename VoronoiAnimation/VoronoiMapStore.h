//
//  VoronoiMapStore.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

// Quick and dirty data store to hold Voronoi Maps. Very basic functionality:
//      sharedStore: Get a singleton of the data store
//      allVoronoiMaps: An array of everything in the store
//      clearVoronoiMaps: Delete the store
//      saveToDisk: Save the entire dataStore to disk
//      saveVoronoiMap: Save a specific map to the dataStore
//      removeVoronoiMapByID: Remove a specific map from the dataStore
//      generateVoronoiMapTitle: Generate an unused suggested name for a new map

#import <Foundation/Foundation.h>
#import "VoronoiMap.h"

@interface VoronoiMapStore : NSObject

+ (instancetype)sharedStore;

@property (nonatomic, readonly) NSArray *allVoronoiMaps;

- (void)clearVoronoiMaps;

- (BOOL)saveToDisk;
- (BOOL)saveVoronoiMap:(VoronoiMap *)vMap;
- (BOOL)removeVoronoiMapByID:(NSUUID *)uuID;

- (VoronoiMap *)getVoronoiMapByID:(NSUUID *)uuID;
- (NSString *)generateVoronoiMapTitle;

@end
