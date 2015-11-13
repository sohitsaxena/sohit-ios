//
//  fetchdataTableViewController.m
//  hungrymantra
//
//  Created by Parag Sharma on 30/09/15.
//  Copyright (c) 2015 Mantra Labs. All rights reserved.
//

#import "userslist.h"
#import "wallet.h"

@interface userslist ()
//@property (weak, nonatomic) UITextField *id;


@end

@implementation userslist
{
   NSMutableArray *usersList;
    NSData *data;
   
}


- (void)viewDidLoad {
    
   NSURL *url = [NSURL URLWithString:@"http://api.hungrymantra.zolome.com/user/"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    NSError *error = nil;
    
    
    
    NSMutableArray *datafromserver = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

    usersList =[[NSMutableArray alloc]init];
    
    
    
    for (NSDictionary *dict in datafromserver) {
        
        NSString *str = [dict objectForKey:@"id"];
        
        
        
        [usersList addObject:str];
        
    }

    NSLog(@"%@",usersList);
    
    [self.tableView reloadData];
    

    
    
//    int i;
//    
//        if ([data length] > 0 && error == nil)
//        {                //NSDictionary *dict =[[NSDictionary alloc]init];
//                     NSMutableArray *users = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            usersList=[[NSMutableArray alloc]init];
//                      usersList = [NSMutableArray new];
//            usersList =[[NSMutableArray alloc]initWithObjects:@"contact_no", @"email",@"first_name",@"full_name" ,@"id" ,@"is_admin", @"last_name", @"password",@"role",@"wallet_amount", nil ];
//                     for (NSDictionary *user1 in users) {
//                         NSString *user =[user1 objectForKey:@"full_name"];
//                         [usersList addObject:user];
//                         
//    }
////                 NSLog(@"%@", usersList);
//        
//        for(i =0; i<usersList.count; i++)
//        {
//            if([users containsObject:@"full_name"])
//            {
//               
//
//                NSLog(@"hello");
//            }
//        }
//
//    

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [usersList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellidentity=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentity ];
    if (cell==nil)
    {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentity];
        
    }
    
//        cell.textLabel.text = [usersList objectAtIndex:indexPath.row];
    return cell;
    }


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if ([segue.identifier isEqualToString:@"particularuser"]) {
//        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        
//         particularuserViewController *destViewController = segue.destinationViewController;
//        
//        destViewController.mantrausers  = [usersList objectAtIndex:indexPath.row];
//        
//        destViewController.title = destViewController.mantrausers;
//    }}
//




@end
