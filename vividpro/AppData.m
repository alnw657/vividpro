//
//  AppData.m
//  vividpro
//
//  Created by Alan on 9/6/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import "AppData.h"

@implementation AppData

-(id)init
{
    if(self = [super init])
    {
        [FIRApp configure];
        _rootNode = [[FIRDatabase database] reference];
        _userNode = [_rootNode child:@"users"];
        _dataNode = [_rootNode child:@"data"];
    }
    return self;
}

+(id)sharedManager
{
    static AppData *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    sharedManager = [[self alloc] init];
    });
    return sharedManager;
}
@end
