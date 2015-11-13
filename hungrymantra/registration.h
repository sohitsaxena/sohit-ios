//
//  SECONDViewController.h
//  hungrymantra
//
//  Created by Parag Sharma on 23/09/15.
//  Copyright (c) 2015 Mantra Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registration : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *fullname;
@property (weak, nonatomic) IBOutlet UITextField *contactno;
@property (weak, nonatomic) IBOutlet UITextField *firstname;

@property (weak, nonatomic) IBOutlet UITextField *lastname;
- (IBAction)button:(id)sender;
@end
