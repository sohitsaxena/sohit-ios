//
//  THIRDViewController.m
//  hungrymantra
//
//  Created by Parag Sharma on 24/09/15.
//  Copyright (c) 2015 Mantra Labs. All rights reserved.
//

#import "wallet.h"
#import "userslist.h"

@interface wallet ()
@end

@implementation wallet
{
    NSMutableArray *usersList;
    NSMutableArray *usersInfoArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//

- (IBAction)LOGOUT:(id)sender {
//    NSDictionary *dict = @{@"amount":self.ammount.text, @"user_id":self.userid.text};
//NSDictionary *dict = @{ @"type":self.cardtype.text , @"status":self.status.text, @"source":self.source.text,@"amount":self.ammount.text, @"user_id":self.userid.text};
    
        NSDictionary *dict = [[NSDictionary alloc] init];
//        dict = @{@"email":self.usernameone.text,@"password":self.passwordone.text};
//     @"type":self.cardtype.text , @"status":self.status.text, @"source":self.source.text,
    



    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];
    NSString *post =[[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSURL *url = [NSURL URLWithString:@"http://api.hungrymantra.zolome.com/logout"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setHTTPMethod:@"GET"];
    [theRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//   [theRequest setHTTPBody:postData];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:theRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil)
         {NSString* response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
             NSLog(@"response%@", response);
             NSString *result =[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
             NSLog(@"result%@", result);
             }
     }];
     
     
         
     

    
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"success" message:@"you logged out successfully" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
    
    [alert show];
    [self performSegueWithIdentifier:@"firstviewcontroller" sender:nil];

}

- (IBAction)enter:(id)sender {
//    NSLog(@"%@",self.cardtype.text);
//    NSLog(@"%@",self.status.text);
//    NSLog(@"%@",self.source.text);
    NSLog(@"%@",self.ammount.text);
   NSLog(@"%@",self.userid);
//    NSArray *values =[[NSArray alloc]init];
//    NSArray *valuesone =[[NSArray alloc]init];
//    values = [NSArray arrayWithObjects:@"type",  @"status", @"source", nil];
//    valuesone =[NSArray arrayWithObjects:@"Credit", @"success", @"wallet_recharge", nil];
//    NSLog(@"values%@", values);
//        NSArray *Makes = [values arrayByAddingObjectsFromArray:valuesone];
//    NSLog(@"%@", Makes);
//    static NSArray *payment =@"wallet";
//    
////
////    //
//    
//    UITextView *textview =[[UITextView alloc]init]
//    textview.text =[values objectAtIndex];
//    
//   
//    UITextView *text= [UI imageNamed:[imagesArraytwo objectAtIndex:indexPath.row]];
//    [cell addSubview: image];
//    NSDictionary *dictone =@{@"type":@"cardtype", @"status":@"status", @"source":@"source"};
    NSDictionary *dict = @{ @"type":@"Credit", @"status":@"success", @"source":@"wallet_recharge",@"amount":self.ammount.text, @"user_id":self.userid.text};
//@"type":self.cardtype.text , @"status":self.status.text, @"source":self.source.text,
//    
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];

    
    NSString *post =[[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSURL *url = [NSURL URLWithString:@"http://api.hungrymantra.zolome.com/transaction"];
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
             
             NSString *urlString = @"http://api.hungrymantra.zolome.com/user/";
             urlString = [urlString stringByAppendingFormat:@"%@",self.userid.text];
             NSURL *url_get = [NSURL URLWithString:urlString];
             
             NSData *jsonData = [NSData dataWithContentsOfURL:url_get];
             
             NSError *error = nil;
             
             
             
             NSMutableArray *usersInfo = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
             usersInfoArray =[[NSMutableArray alloc]init];
             NSLog(@"user_info%@", usersInfo);
             
             
             
         }else if (error != nil)
         {
             NSLog(@"error%@", error);
         }
        
         
         
     }];
    
    
    


     [self performSegueWithIdentifier:@"user" sender:nil];
//    // Check if any data returned.
//    if (data != nil) {
//        // Convert the returned data into a dictionary.
//        
//        
//        NSMutableDictionary *returneddict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    }
//    
//    if (error != nil) {
//        NSLog(@"%@", [error localizedDescription]);
//    }
//    else{
//        dict = [[returneddict objectForKey:@"hungrymantra"] objectAtIndex:0];
//        NSLog(@"%@", dict);
//    }
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"user"]) {
//        NSIndexPath *indexpath= [[NSIndexPath alloc]init];
//        userslist *dest = segue.destinationViewController;
//        
//        dest.names= [usersList objectAtIndex:indexpath.row];
//        
//        dest.title= dest.names;
//        
//        
//    }
//}


}

@end
