//
//  LoginModel.m
//  CatchMe
//
//  Created by Dean on 09/04/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

-(void)authUser:(NSString*)username passParam:(NSString*)password withCompletion:(void (^)(int responseValue))completion
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{
                                 @"Username": username,
                                 @"Password": password
                                 };
    
    [manager POST:@"http://vast-beyond-6485.herokuapp.com/login"
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
