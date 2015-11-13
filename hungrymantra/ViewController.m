//
//  ViewController.m
//  hungrymantra
//
//  Created by Parag Sharma on 22/09/15.
//  Copyright (c) 2015 Mantra Labs. All rights reserved.
//

#import "ViewController.h"
#import "wallet.h"



@interface ViewController()

@property (weak, nonatomic) IBOutlet UIButton *newuser;

- (IBAction)newuser:(id)sender;


////@interface hungrymantra : ViewController
//{
//   
//    NSMutableURLRequest *theRequest;
//    NSURL *url;
//    NSOperationQueue *queue;
//    NSMutableData *webdata;
//}
//@property (nonatomic, strong) NSMutableURLRequest *theRequest;
//@property (nonatomic, strong) NSURL *url;
//@property (nonatomic, strong) NSOperationQueue *queue;
//@property(nonatomic, strong) NSDictionary *dict;
//@end
//    
//@implementation hungrymantra
//@synthesize theRequest, url, queue, dict;
//
@end
@implementation ViewController
{ NSMutableData *webdata;

}



- (void)viewDidLoad {
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)button:(id)sender {


    


- (NSString *)validate {
    NSString *errorMessage;
    
    NSString *value = @"[^@]+@[A-Za-z0-9.-]+\\.[A-Za-z]+";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", value];
    
    
    if (![emailPredicate evaluateWithObject:self.usernameone.text]){
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"please enter valid email" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
        [alert show];
        
        
        errorMessage = @"Please enter a valid email address";
    }
    
    else if (!(self.passwordone.text.length >= 8)){
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"oo sorry!!" message:@"please enter min 8 digit password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil ];
        [alert show];
        
        errorMessage = @"Please enter password";
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





- (IBAction)submit:(id)sender{
    
//    NSError *err;
    
    NSString* usernameone = _usernameone.text;
    NSString* passwordone = _passwordone.text;
    
    if([_usernameone.text isEqualToString:@"" ]&& [_passwordone.text isEqualToString:@""])
    {
                  UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"failure" message:@"please fill the entries" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil ];
        [alert show];
    
    
        _message.text = @"Input Your Value";
        [_usernameone resignFirstResponder];
        [_passwordone resignFirstResponder];
        return;
    }
    
    wallet *thirdviewcontroller= [self.storyboard instantiateViewControllerWithIdentifier:@"thirdviewcontroller"];
    [self.navigationController pushViewController:thirdviewcontroller animated:YES];

    
    NSString *errorMessage = [self validate];
    
    if ([errorMessage isEqualToString:@"Success"]) {
        [self registerButtonTapped:@"POST" ];
        }
  
    
        NSDictionary *dict = @{ @"email":self.usernameone.text , @"password":self.passwordone.text };
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];
    NSString *post =[[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    // NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    
    
    NSURL *url = [NSURL URLWithString:@"http://api.hungrymantra.zolome.com/login"];
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
                      }
         else if (error != nil)
         {
             NSLog(@"error%@", error);
            
         }
         
     }];
    
    
//    NSString *post =[[NSString alloc] initWithFormat:@"email=%@&password=%@", usernameone,passwordone];
//    
//    
//    
//    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//
//    
//    
///    
//    NSURL *url = [NSURL URLWithString:@"http://api.hungrymantra.zolome.com/login"];
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//   [theRequest setHTTPMethod:@"POST"];
//   //[theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    [theRequest setHTTPBody:postData];
////        [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
////        [theRequest setValue:@"UTF-8" forHTTPHeaderField:@"charset"];
////        [theRequest setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
////


    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];{
    
    if(theConnection){
        NSLog(@"connection");
               webdata  = [NSMutableData new];
    }
    else{
        NSLog(@"No Connection");
    }
    
    

//    NSURLConnection *Connection =[[ NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//
//    if( Connection )
//    {
//        webdata = [NSMutableData new] ;
//       
//        webdata = [[[NSMutableData alloc] initWithContentsOfURL:return];
//        NSString *test =[test alloc]initWithNibName:@"test" bundle:nil];
//        [self presentedViewController: test animated:YES];
//       [test release];
//
//    }
//    else
//    {
//              [_usernameone resignFirstResponder];
//        [_passwordone resignFirstResponder];
//        
//        _usernameone.text = nil;
//         _passwordone.text = nil;
////        [self.webdata appendData:data];
//}
//}
//    
//- (void)Connection:(NSURLConnection *)Connection didFailWithError:(NSError *)error
//{
//    
//    [connection release];
//    [webData release];
//}
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
    

//    - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)
//    response{
//        
//        if([response isKindOfClass:[NSHTTPURLResponse class]])
//        {
//            NSHTTPURLResponse *theResponse = (NSHTTPURLResponse*)response;
//            NSInteger theStatusCode = [theResponse statusCode];
//        }
//    }
//    -(void) Connection:(NSURLConnection *)Connection didReceiveRespone:(NSURLResponse *) response{
//        
//    
//    //    -(void)Connection:(NSURLConnection *)Connection didReceiveResponse:(NSURLResponse *)response
//    
//        [webdata setLength: @""];
//    }
//    -(void)Connection:(NSURLConnection *)Connection didReceiveData:(NSData *)data
//    {
//
    
    }}
- (void)Connection:(NSURLConnection *)Connection didReceiveData:(NSData *)data
{
    [webdata appendData:data];
    NSError *error;
    
//    NSLog(@"receiving data is%@",webdata);
    
    
    
    
    NSDictionary *resultdict = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
    
    NSLog(@"%@",resultdict);
    NSData *resultdata=[NSJSONSerialization dataWithJSONObject:resultdict options:0 error:&error ];
    
    NSString *str = [[NSString alloc]initWithData:resultdata encoding:NSUTF8StringEncoding];
    NSLog(@"%@", str);
    
    if([resultdict isEqualToDictionary:@{@"status":@"error",@"data":@"Invalid Credentials"}])
    {
        UIAlertView *fieldempty=[[UIAlertView alloc]initWithTitle:@"oooopps" message:@"invalid credential" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
        [fieldempty show];
    
}
    else{
        
        

        UIAlertView *fieldempty=[[UIAlertView alloc]initWithTitle:@"welcome!!!!!" message:@"successfully logged in.." delegate:self cancelButtonTitle:@"okkk" otherButtonTitles:nil, nil];
    [fieldempty show];
        [self performSegueWithIdentifier:@"pushsegue" sender:nil];
    
    }}

//    NSError* error;
//   // NSURLResponse *responsedata;
//    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error]
//    
//    NSDictionary* latest = [json objectForKey:@"dict"];
//    
//    NSLog(@"dict: %@", latest);
//
    
    
//    NSError *error;
//    NSLog(@"%@",data);
//    
//   NSString *resultdict = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableLeaves error: &error];
//    NSLog(@"%@",resultdict);
//    
    
    
//    NSURLResponse *response;
//    NSURLRequest *request;
//    NSData *POSTReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
//    NSData *theReply = [[NSString alloc] initWithBytes:[POSTReply bytes] length:[POSTReply length] encoding: NSASCIIStringEncoding];   NSLog(@"json Reply : %@", theReply);
//     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:POSTReply options:0 error:nil];
//    NSLog(@"%@",dict);
//

    
//    NSError *jsonError;
//    NSData *dict = [@"{@"email", @"password"}" dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *dict = [@"{\"usernameone\":\"passwordone\"}" dataUsingEncoding:NSUTF8StringEncoding];
////    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:dict
//                                                         options:NSJSONReadingMutableContainers
//                                                         error:&jsonError];




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self->webdata setLength:0];
   NSLog(@"recieving response");
}



-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    NSLog(@"No Respose from Server");
    return;
    
}




//        [webdata appendData:data];
//    }
//    -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//    {
//        
//        [connection release];
//        [webData release];
//    }

//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
//    {
//        
//        NSString *loginStatus = [[NSString alloc] initWithBytes: [webdata mutableBytes] length:[webdata length] encoding:NSUTF8StringEncoding];
//        NSLog(loginStatus);
//        _message.text = loginStatus;
//        




- (IBAction)newuser:(id)sender {
    [self performSegueWithIdentifier:@"newuser" sender:nil];
}
@end

    