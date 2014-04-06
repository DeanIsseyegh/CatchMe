//
//  TestModel.m
//  CatchMe
//
//  Created by Dean on 24/03/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import "TestModel.h"

//http://127.0.0.1:3000
//http://vast-beyond-6485.herokuapp.com

@implementation TestModel

- (void)sendLocation:(NSString*)latitude :(NSString*)longitude
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    double latiDouble = [latitude doubleValue];
    double longiDouble = [longitude doubleValue];
    NSNumber *longiNumber = [[NSNumber alloc] initWithDouble:longiDouble];
    NSNumber *latiNumber  = [[NSNumber alloc] initWithDouble:latiDouble];
    
    NSDictionary *parameters = @{
                                 @"Username": @"Deano",
                                 @"latitude": longiNumber,
                                 @"longitude": latiNumber
                                 };
    
    [manager POST:@"http://vast-beyond-6485.herokuapp.com"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
        
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *err)
     {
         NSLog(@"Error: %@", err);
     }];
}

//Receive data from post method
-(void)connection:(NSURLConnection *)connection didRecieveData:(NSData *)data
{
    NSLog(@"recieving data from post method");
}

//Recieve the error report in case of connection is not made to server
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection did fail with an error");
}

//Used to process the data after connection has been made successfully
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Connection has been made successfully");
}

@end
