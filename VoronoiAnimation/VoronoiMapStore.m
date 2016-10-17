//
//  VoronoiMapStore.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "VoronoiMapStore.h"
#import "VMapConstants.h"

@interface VoronoiMapStore ()
@property (nonatomic, strong) NSMutableDictionary *privateVoronoiMaps;
@end

@implementation VoronoiMapStore

#pragma mark- Singleton

+ (instancetype)sharedStore {
    static VoronoiMapStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

#pragma mark- Initializers

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        NSString *archivePath = [self voronoiMapArchivePath];
        _privateVoronoiMaps = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
        
        if (!_privateVoronoiMaps) {
            _privateVoronoiMaps = [NSMutableDictionary dictionary];
        }
    }
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[VoronoiMapStore sharedStore]" userInfo:nil];
    return nil;
}

#pragma mark- Disk Storage

- (BOOL)saveToDisk {
    NSString *archivePath = [self voronoiMapArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:self.privateVoronoiMaps toFile:archivePath];
}

#pragma mark- SoundMap Management

- (VoronoiMap *)getVoronoiMapByID:(NSUUID *)uuID {
    return [self.privateVoronoiMaps objectForKey:uuID];
}

- (BOOL)saveVoronoiMap:(VoronoiMap *)voronoiMap {
    // Don't save nil values into the store
    if (!voronoiMap) {
        return FALSE;
    }
    [self.privateVoronoiMaps setObject:voronoiMap forKey:voronoiMap.uuID];
    if ([self saveToDisk]) {
        return TRUE;
    }
    return FALSE;
}

- (BOOL)removeVoronoiMapByID:(NSUUID *)uuID {
    
    [self.privateVoronoiMaps removeObjectForKey:uuID];
    if (![self saveToDisk]) {
        return FALSE;
    }
    return TRUE;
}

- (void)clearVoronoiMaps {
    [self.privateVoronoiMaps removeAllObjects];
    [self saveToDisk];
}

#pragma mark- Accessors

- (NSArray *)allVoronoiMaps {
    return [self.privateVoronoiMaps allValues];
}

#pragma mark- Private Utility Functions

- (NSString *)voronoiMapArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:kArchiveName];
}

- (NSString *)generateVoronoiMapTitle
{
    NSString *baseTitle = kBaseSoundMapTitle;
    NSString *title = baseTitle;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
    NSArray *results = [self.allVoronoiMaps filteredArrayUsingPredicate:predicate];
    int suffix = 2;
    
    while ([results count]) {
        title = [baseTitle stringByAppendingString: [NSString stringWithFormat:@" %d", suffix]];
        predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
        results = [self.allVoronoiMaps filteredArrayUsingPredicate:predicate];
        suffix++;
    }
    return title;
}

@end
