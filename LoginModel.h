//
//  LoginModel.h
//  CatchMe
//
//  Created by Dean on 09/04/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

-(void)authUser:(NSString*)username passParam:(NSString*)password withCompletion:(void (^)(int responseValue))completion;

@end
