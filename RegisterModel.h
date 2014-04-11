//
//  RegisterModel.h
//  CatchMe
//
//  Created by Dean on 06/04/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterModel : NSObject

-(BOOL) isUsernameLengthValid: (NSString*)username;
-(BOOL) isUsernameValidChars: (NSString*)username;

-(BOOL) isPasswordValidLength: (NSString*)password;
-(BOOL) isPasswordValidChars: (NSString*)password;

-(BOOL) isEmailValidLength:(NSString *)email;
-(BOOL) isEmailValidChars:(NSString *)email;

-(void)registerUser:(NSString*)username emailParam:(NSString*)email passParam:(NSString*)password withCompletion:(void (^)(int responseValue))completion;

@end
