//
//  RegisterModel.m
//  CatchMe
//
//  Created by Dean on 06/04/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import "RegisterModel.h"

@implementation RegisterModel

-(BOOL) isUsernameLengthValid: (NSString*)username
{
    if (username.length < 3 || username.length > 12)
        return false;
    else
        return true;
}

-(BOOL) isUsernameValidChars:(NSString*)username
{
    NSCharacterSet *s = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_"];
    s = [s invertedSet];
    NSRange r = [username rangeOfCharacterFromSet:s];
    
    if (r.location != NSNotFound)
        return false;
    else
        return true;
}

-(BOOL) isPasswordValidLength:(NSString *)password
{
    if (password.length < 6 || password.length > 15)
        return false;
    else
        return true;
}

-(BOOL) isPasswordValidChars:(NSString *)password
{
    NSCharacterSet *s = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"];
    s = [s invertedSet];
    NSRange r = [password rangeOfCharacterFromSet:s];
    
    if (r.location != NSNotFound)
        return false;
    else
        return true;
}

-(BOOL) isEmailValidLength:(NSString *)email
{
    if (email.length < 5 || email.length > 60)
        return false;
    else
        return true;
}

-(BOOL) isEmailValidChars:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:email];
}

-(void)registerUser:(NSString*)username emailParam:(NSString*)email passParam:(NSString*)password withCompletion:(void (^)(int responseValue))completion
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{
                                 @"Username": username,
                                 @"Email": email,
                                 @"Password": password
                                 };
    
    [manager POST:@"http://vast-beyond-6485.herokuapp.com/register"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         int responseValue = [[responseObject objectForKey:@"res"] intValue];
         if (completion)
             completion(responseValue);
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *err)
     {
         NSLog(@"Error: %@", err);
         if (completion)
             completion(RES_UNKNOWN);
     }];
}



@end
