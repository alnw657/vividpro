//
//  UserClass.h
//  vividpro
//
//  Created by Alan on 9/6/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UserClass : NSObject

@property (nonatomic, retain)NSString * name;
@property (nonatomic, retain)NSString * email;
@property (nonatomic, retain)NSString * uid;

-(id)initWith:(NSString *)inpName
     andEmail:(NSString *)inpEmail
       andUid:(NSString *)inpUid;
@end
