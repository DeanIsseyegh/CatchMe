//
//  ErrorCodesProtocol.h
//  CatchMe
//
//  Created by Dean on 08/04/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

/*
 var success = {'res' : 0}
 var errConnectToDB = {'res' : 1};
 var errCollection = {'res' : 2};
 var errEnsureIndex = {'res' : 3};
 var errUpdate = {'res' : 4};
 var errCommand = {'res' : 5};
 var errFindOne = {'res' : 6};
 var errInsert = {'res' : 7};
 var errUsernameAlreadyTaken = {'res' : 8}; **/

#import <Foundation/Foundation.h>

@protocol ErrorCodesProtocol <NSObject>

extern NSNumber *RES_SUCCESS = [NSNumber numberWithInteger:0];

extern NSNumber *RES_ERR_DB_CONNECT_FAIL = [NSNumber numberWithInteger:1];
static *const NSNumber RES_ERR_COLLECTION_FAIL = [NSNumber numberWithInteger:2];
static *const NSNumber RES_ERR_ENSUREINDEX_FAIL = [NSNumber numberWithInteger:3];
static *const NSNumber RES_ERR_UPDATE_FAIL = [NSNumber numberWithInteger:4];
static *const NSNumber RES_ERR_COMMAND_FAIL = [NSNumber numberWithInteger:5];
static *const NSNumber RES_ERR_FINDONE_FAIL = [NSNumber numberWithInteger:6];
static *const NSNumber RES_ERR_INSERT_FAIL = [NSNumber numberWithInteger:7];
static *const NSNumber RES_ERR_USERNAME_TAKEN = [NSNumber numberWithInteger:8];


@end


