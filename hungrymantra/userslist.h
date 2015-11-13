//
//  fetchdataTableViewController.h
//  hungrymantra
//
//  Created by Parag Sharma on 30/09/15.
//  Copyright (c) 2015 Mantra Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "THIRDViewController.h"

@interface userslist : UITableViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)NSString *names;

@end
