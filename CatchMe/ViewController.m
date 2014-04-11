//
//  ViewController.m
//  CatchMe
//
//  Created by Dean on 20/03/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import "ViewController.h"
#import "MainMenuViewController.h"
#import "RegisterViewController.h"
#import "LoginModel.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize usernameTextField;
@synthesize passwordTextField;
@synthesize logInButton;
@synthesize usernameText;

int RES_SUCCESS = 0;

int RES_ERR_DB_CONNECT_FAIL = 1;
int RES_ERR_COLLECTION_FAIL = 2;
int RES_ERR_ENSUREINDEX_FAIL = 3;
int RES_ERR_UPDATE_FAIL = 4;
int RES_ERR_COMMAND_FAIL = 5;
int RES_ERR_FINDONE_FAIL = 6;
int RES_ERR_INSERT_FAIL = 7;
int RES_ERR_USERNAME_TAKEN = 8;
int RES_ERR_USERPASS_NOMATCH = 9;

int RES_UNKNOWN = 99;

LoginModel *lm;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    //Assign textfield delegates to self
    usernameTextField.delegate = self;
    passwordTextField.delegate = self;
    
    //Set text fields to return when Done is pressed
    usernameTextField.returnKeyType = UIReturnKeyDone;
    passwordTextField.returnKeyType = UIReturnKeyDone;
    
    //Pass on username from Register screen
    usernameTextField.text = self.usernameText;
    
    lm = [[LoginModel alloc] init];
}

- (IBAction)onClickLogin:(id)sender
{
    [lm authUser:[usernameTextField text] passParam:[passwordTextField text] withCompletion:^(int responseValue){
       
        if (responseValue == RES_SUCCESS)
        {
            NSLog(@"Success!");
        }
        else if (responseValue == RES_ERR_USERPASS_NOMATCH)
        {
            NSLog(@"Username and password don't match!");
        }
        else if (responseValue == RES_ERR_DB_CONNECT_FAIL)
        {
            NSLog(@"Could not connect to the server - please try again later");
        }
        else
        {
            NSLog(@"Generic Error");
        }
        
        
    }];
}



@end
