//
//  RegisterViewController.h
//  CatchMe
//
//  Created by Dean on 06/04/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>

@interface RegisterViewController : UIViewController  <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UILabel *usernameMessage;
@property (weak, nonatomic) IBOutlet UILabel *emailMessage;
@property (weak, nonatomic) IBOutlet UILabel *passwordMessage;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UILabel *registerButtonMessage;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndi;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
