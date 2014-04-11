//
//  RegisterViewController.m
//  CatchMe
//
//  Created by Dean on 06/04/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterModel.h"
#import "ViewController.h"

@interface RegisterViewController ()
@end

@implementation RegisterViewController

@synthesize usernameField;
@synthesize emailField;
@synthesize passwordField;

@synthesize usernameMessage;
@synthesize emailMessage;
@synthesize passwordMessage;

@synthesize registerButton;
@synthesize registerButtonMessage;

@synthesize activityIndi;

RegisterModel *rm;

static NSString *const lengthInvalid = @"Field is either too short or too long";

static NSString *const usernameValid = @"Valid Username";
static NSString *const usernameCharsInvalid = @"Username may only contain letters, numbers and _'s";

static NSString *const emailValid = @"Valid Email";
static NSString *const emailCharsInvalid = @"Invalid email detected";

static NSString *const passwordValid = @"Valid password";
static NSString *const passwordCharsInvalid = @"Password may only contain letters and numbers";

static NSString *const usernameTaken = @"That username is already taken";
static NSString *const unknownErr = @"Could not connect to server";
static NSString *const genericErr = @"An error occured. Please try again later";

static NSString *const registerSuccess = @"Thank you for Registering!";

static BOOL isUsernameCorrect = NO;
static BOOL isEmailCorrect    = NO;
static BOOL isPasswordCorrect = NO;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)areAllFieldsValid
{
    if ( [rm isUsernameLengthValid:[usernameField text]]
        && [rm isUsernameValidChars:[usernameField text]] )
    {
        usernameField.backgroundColor = [UIColor greenColor];
        isUsernameCorrect = YES;
    }
    else if (![rm isUsernameLengthValid:[usernameField text]])
    {
        usernameMessage.textColor     = [UIColor redColor];
        usernameMessage.text          = lengthInvalid;
        usernameField.backgroundColor = [UIColor redColor];
    }
    else if (![rm isUsernameValidChars:[usernameField text]])
    {
        usernameMessage.textColor     = [UIColor redColor];
        usernameMessage.text          = usernameCharsInvalid;
        usernameField.backgroundColor = [UIColor redColor];
    }
    
    if ( [rm isEmailValidLength:[emailField text]]
        && [rm isEmailValidChars:[emailField text]] )
    {
        emailField.backgroundColor = [UIColor greenColor];
        isEmailCorrect = YES;
    }
    else if (![rm isEmailValidLength:[emailField text]])
    {
        emailMessage.textColor     = [UIColor redColor];
        emailMessage.text          = emailCharsInvalid;
        emailField.backgroundColor = [UIColor redColor];
    }
    else if (![rm isEmailValidChars:[emailField text]])
    {
        emailMessage.textColor     = [UIColor redColor];
        emailMessage.text          = emailCharsInvalid;
        emailField.backgroundColor = [UIColor redColor];
    }
    
    if ( [rm isPasswordValidLength:[passwordField text]]
        && [rm isPasswordValidChars:[passwordField text]] )
    {
        passwordField.backgroundColor = [UIColor greenColor];
        isPasswordCorrect = YES;
    }
    else if (![rm isPasswordValidLength:[passwordField text]])
    {
        passwordMessage.textColor     = [UIColor redColor];
        passwordMessage.text          = lengthInvalid;
        passwordField.backgroundColor = [UIColor redColor];
    }
    else if (![rm isPasswordValidChars:[passwordField text]])
    {
        passwordMessage.textColor     = [UIColor redColor];
        passwordMessage.text          = passwordCharsInvalid;
        passwordField.backgroundColor = [UIColor redColor];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Assign textfield delegates to self
    usernameField.delegate = self;
    emailField.delegate = self;
    passwordField.delegate = self;
    
    //Set text fields to return when Done is pressed
    usernameField.returnKeyType = UIReturnKeyDone;
    emailField.returnKeyType = UIReturnKeyDone;
    passwordField.returnKeyType = UIReturnKeyDone;
    
    rm = [[RegisterModel alloc] init];
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

- (IBAction)onClickRegisterButton:(id)sender
{
    [self areAllFieldsValid];
    if (isUsernameCorrect && isEmailCorrect && isPasswordCorrect)
    {
        [self startLoading];
        [rm registerUser:[usernameField text] emailParam:[emailField text] passParam:[passwordField text] withCompletion:^(int responseValue){
        if (responseValue == RES_SUCCESS)
        {
            [self stopLoading];
            registerButtonMessage.textColor = [UIColor greenColor];
            registerButtonMessage.text = registerSuccess;
            [self goToLoginScreen];
        }
        else if (responseValue == RES_ERR_USERNAME_TAKEN)
        {
            [self stopLoading];
            registerButtonMessage.textColor = [UIColor redColor];
            registerButtonMessage.text = usernameTaken;
            
            usernameMessage.textColor     = [UIColor redColor];
            usernameField.backgroundColor = [UIColor redColor];
        }
        else if (responseValue == RES_UNKNOWN)
        {
            [self stopLoading];
            registerButtonMessage.textColor = [UIColor redColor];
            registerButtonMessage.text = unknownErr;
        }
        else
        {
            [self stopLoading];
            registerButtonMessage.textColor = [UIColor redColor];
            registerButtonMessage.text = genericErr;
        }
        }];
    }
}

-(void)startLoading
{
    [self.activityIndi startAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    self.registerButton.enabled = NO;
    self.registerButton.userInteractionEnabled = NO;
}

-(void)stopLoading
{
    [self.activityIndi stopAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
    self.registerButton.enabled = YES;
    self.registerButton.userInteractionEnabled = YES;
}

-(void)goToLoginScreen
{
    //DO STUFF
}

@end
