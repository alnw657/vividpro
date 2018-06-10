//
//  UserClass.m
//  vividpro
//
//  Created by Alan on 9/6/18.
//  Copyright © 2018 Alan. All rights reserved.
//

#import "UserClass.h"

@implementation UserClass

-(id)initWith:(NSString *)inpName
     andEmail:(NSString *)inpEmail
       andUid:(NSString *)inpUid;
{
    _name = inpName;
    _email = inpEmail;
    _uid = inpUid;
    return self;
}
@end
