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

@property (strong, nonatomic) NSString *usernameText;

extern int RES_SUCCESS;

extern int RES_ERR_DB_CONNECT_FAIL;
extern int RES_ERR_COLLECTION_FAIL;
extern int RES_ERR_ENSUREINDEX_FAIL;
extern int RES_ERR_UPDATE_FAIL;
extern int RES_ERR_COMMAND_FAIL;
extern int RES_ERR_FINDONE_FAIL;
extern int RES_ERR_INSERT_FAIL;
extern int RES_ERR_USERNAME_TAKEN;
extern int RES_ERR_USERPASS_NOMATCH;

extern int RES_UNKNOWN;

@end
