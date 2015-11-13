//
//  ViewController.h
//  hungrymantra
//
//  Created by Parag Sharma on 22/09/15.
//  Copyright (c) 2015 Mantra Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *loginpage;

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UITextField *usernameone;



@property (weak, nonatomic) IBOutlet UILabel *password;
@property (weak, nonatomic) IBOutlet UITextField *passwordone;

@property (weak, nonatomic) IBOutlet UILabel *message;

- (IBAction)submit:(id)sender;

@end

