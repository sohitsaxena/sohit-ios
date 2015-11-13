//
//  SECONDViewController.m
//  hungrymantra
//
//  Created by Parag Sharma on 23/09/15.
//  Copyright (c) 2015 Mantra Labs. All rights reserved.
//

#import "registration.h"

@interface registration ()

@end

@implementation registration

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)validate {
    NSString *errorMessage;
    
    NSString *value = @"[^@]+@[A-Za-z0-9.-]+\\.[A-Za-z]+";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", value];
    
    
    if (![emailPredicate evaluateWithObject:self.email.text]){
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"please enter valid email" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
        [alert show];
        

        errorMessage = @"Please enter a valid email address";}
    
    else if (!(self.password.text.length >= 8)){
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"please enter min 8 digit password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
        [alert show];

            errorMessage = @"Please enter password";
        }
        else if (!(self.fullname.text.length >= 8)){
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"please enter 8 character name" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
            [alert show];

            errorMessage = @"Please enter a fullname";
    }
        else if (!(self.contactno.text.length >= 10)){
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"ooops!! contactno. should be of 10 digit" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
            [alert show];
            
            errorMessage = @"Please enter a valid contact no.";
        }
    
        else if (!(self.firstname.text.length >= 4)){
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"please enter valid name" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
            [alert show];

            errorMessage = @"Please enter a first name";
        }
    
        else if (!(self.lastname.text.length >= 4)){
            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"please enter valid last name" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
            [alert show];
            
            errorMessage = @"Please enter a lastname";
        }
    
    return errorMessage;
}


- (void)registerButtonTapped:(id)sender {
    NSString *errorMessage = [self validate];
    if (errorMessage) {
        [[[UIAlertView alloc] initWithTitle:nil message:errorMessage delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
        return;
    }
}


- (IBAction)button:(id)sender {
    NSLog(@"%@",self.email.text);
    NSLog(@"%@",self.password.text);
    NSLog(@"%@",self.fullname.text);
    NSLog(@"%@",self.lastname.text);
    NSLog(@"%@",self.firstname.text);
    NSLog(@"%@",self.contactno.text);
    
    
    
    NSDictionary *dict = @{ @"email":self.email.text , @"password":self.password.text,@"full_name":self.fullname.text, @"contact_number":self.contactno.text, @"first_name":self.firstname.text, @"last_name":self.lastname.text};
    
    
    
    NSString *errorMessage = [self validate];
    
    if ([errorMessage isEqualToString:@"Success"]) {
        [self registerButtonTapped:@"POST" ];
    }

    
    if([self.email.text isEqualToString:@"" ]&& [_password.text isEqualToString:@""] && [self.fullname.text isEqualToString:@""]&& [self.lastname.text isEqualToString:@""]&& [self.firstname.text isEqualToString:@""] && [self.contactno.text isEqualToString:@""])
    {
        
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"please fill all the fields" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
        [alert show];
        
        
        [_email resignFirstResponder];
        [_password resignFirstResponder];
        [_fullname resignFirstResponder];
        [_lastname resignFirstResponder];
        [_firstname resignFirstResponder];
        [_contactno resignFirstResponder];
        
        return;
    }


    
    
    
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];
    NSString *post =[[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    // NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSURL *url = [NSURL URLWithString:@"http://api.hungrymantra.zolome.com/user"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPBody:postData];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:theRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil)
         {
             NSString* response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
             NSLog(@"response%@", response);
             NSString *result =[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"result%@", result);
             
             
         }else if (error != nil)
         {
             NSLog(@"error%@", error);
         }
//         [self performSegueWithIdentifier:@"wallet" sender:nil];
         
     }];
    
    [self performSegueWithIdentifier:@"register" sender:nil];
    
}
@end
