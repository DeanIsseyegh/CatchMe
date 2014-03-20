//
//  ViewController.h
//  CatchMe
//
//  Created by Dean on 20/03/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
-(IBAction)clickedBackground;

@end
