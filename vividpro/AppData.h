//
//  AppData.h
//  vividpro
//
//  Created by Alan on 9/6/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserClass.h"
#import <Firebase.h>

@interface AppData : NSObject

@property (nonatomic, retain) UserClass* curUser;

+(id)sharedManager;

#pragma mark firebase
@property (nonatomic) FIRDatabaseReference *rootNode;
@property (nonatomic) FIRDatabaseReference *dataNode;
@property (nonatomic) FIRDatabaseReference *userNode;

@end
