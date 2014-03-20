//
//  ViewController.m
//  CatchMe
//
//  Created by Dean on 20/03/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import "ViewController.h"
#import "MainMenuViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize usernameTextField;
@synthesize passwordTextField;
@synthesize logInButton;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction) clickedBackground
{
    
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
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Go To Main Menu"]){
        if ([segue.destinationViewController isKindOfClass:[MainMenuViewController class]]){
            MainMenuViewController *mainMenuVC = (MainMenuViewController *)segue.destinationViewController;
        }
    }
}

@end
