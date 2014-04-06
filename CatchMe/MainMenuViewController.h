//
//  MainMenuViewController.h
//  CatchMe
//
//  Created by Dean on 20/03/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *CatchMeButton;
@property (strong, nonatomic)NSString *longitude;
@property (strong, nonatomic)NSString *latitude;

@end
