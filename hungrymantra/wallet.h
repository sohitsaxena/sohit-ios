//
//  THIRDViewController.h
//  hungrymantra
//
//  Created by Parag Sharma on 24/09/15.
//  Copyright (c) 2015 Mantra Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wallet : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *cardtype;

@property (weak, nonatomic) IBOutlet UITextField *status;

@property (weak, nonatomic) IBOutlet UITextField *source;

@property (weak, nonatomic) IBOutlet UITextField *ammount;

@property (weak, nonatomic) IBOutlet UITextField *userid;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *fullname;
@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UITextField *idone;

- (IBAction)LOGOUT:(id)sender;

- (IBAction)enter:(id)sender;
@end
