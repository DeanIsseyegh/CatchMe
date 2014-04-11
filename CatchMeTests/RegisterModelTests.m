//
//  CatchMeTests.m
//  CatchMeTests
//
//  Created by Dean on 20/03/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RegisterModel.h"

@interface RegisterModelTests : XCTestCase

@end

@implementation RegisterModelTests

RegisterModel *rm;

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    rm = [[RegisterModel alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsUsernameLengthValid_returnsFalse_ifUsernameIsLessThan4Chars
{
    NSString *username = @"Bob";
    assert(![rm isUsernameLengthValid:username]);
}

- (void)testIsUsernameLengthValid_returnsTrue_ifUsernameIsMoreThanOrEqualTo4Chars
{
    NSString *username = @"Bob1";
    assert([rm isUsernameLengthValid:username]);
    
    username = @"Charlie";
    assert([rm isUsernameLengthValid:username]);
}

-(void)testIsUsernameLengthValid_returnsFalse_ifUsernameIsMoreThan12Chars
{
    NSString *username = @"Bob1234567812345";
    assert(![rm isUsernameLengthValid:username]);
}

-(void)testIsUsernameValidChars_returnsFalse_ifInvalidCharsAreUsed
{
    NSString *username = @"Bob@B";
    assert(![rm isUsernameValidChars:username]);
    
    username = @"Bob$£@£*'.";
    assert(![rm isUsernameValidChars:username]);
}

-(void)testIsPasswordValidLength_returnsFalse_ifPasswordIsLessThan6Chars
{
    NSString *password = @"lessh";
    assert(![rm isPasswordValidLength:password]);
    
    password = @"le";
    assert(![rm isPasswordValidLength:password]);
}

-(void)testIsPasswordValidLength_returnsFalse_ifPasswordIsMoreThan15Chars
{
    NSString *password = @"1234567891234567";
    assert(![rm isPasswordValidLength:password]);
}

-(void)testIsPasswordValidLength_returnsTrue_IfPasswordIsMoreThan6AndLessThan12_AndContainsNoInvalidChars
{
    NSString *password = @"123456789";
    assert([rm isPasswordValidLength:password]);
}

-(void)testIsPasswordValidChars_returnsFalse_IfPasswordContainsInvalidChars
{
    NSString *password = @"password_@";
    assert(![rm isPasswordValidChars:password]);
}

-(void)testIsEmailValidLength_returnsFalse_IfEmailIsShorterThan5Chars_OrLongerThan50Chars
{
    NSString *email = @"1234";
    assert(![rm isEmailValidLength:email]);
    
    email = @"123456789123456789123456789123456789123456789123456789123456789";
    assert(![rm isEmailValidLength:email]);
}

-(void)testIsEmailValidLength_returnsTrue_IfEmailLongerThan5Chars_AndShorterThan50
{
    NSString *email = @"1234567";
    assert([rm isEmailValidLength:email]);
}

-(void)testIsEmailValidChars_returnsFalse_IfEmailDoesNotContainATSymbol
{
    NSString *email = @"1234567";
    assert(![rm isEmailValidChars:email]);
}

-(void)testIsEmailValidChars_returnsTrue_IfEmailIsCorrectFormat
{
    NSString *email = @"hello@fake.com";
    assert([rm isEmailValidChars:email]);
}
@end
