//
//  MenuViewController.h
//  M13InfiniteTabBar
//
//  Created by Brandon McQuilkin on 3/2/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "M13InfiniteTabBarController.h"


@interface MenuViewController : UITableViewController <M13InfiniteTabBarControllerDelegate>

- (IBAction)facebook:(id)sender;

- (IBAction)twitter:(id)sender;

- (IBAction)instagram:(id)sender;



@end
