//
//  MenuViewController.m
//  M13InfiniteTabBar
//
//  Created by Brandon McQuilkin on 3/2/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "MenuViewController.h"
#import "ViewController.h"
#import "UIViewController+M13InfiniteTabBarExtension.h"
#import "PulsingRequiresAttentionView.h"

@interface MenuViewController ()




@end

@implementation MenuViewController
{
    NSString *display;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  //  self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backround.png"]];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - orientation

/*- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
*/
- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [super numberOfSectionsInTableView:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [super tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    
     [self.navigationController setNavigationBarHidden:YES animated:YES];
    if ([segue.identifier isEqualToString:@"LessThan5TabsSegue"]) {
        display = @"LessThan5Tabs";
        M13InfiniteTabBarController *vc = segue.destinationViewController;
        vc.delegate = self;
    } else if ([segue.identifier isEqualToString:@"GreaterThan5TabsSegue"]) {
        display = @"GreaterThan5Tabs";
        M13InfiniteTabBarController *vc = segue.destinationViewController;
        vc.delegate = self;
        //Set the requires user attention background
        vc.requiresAttentionBackgroundView = [[PulsingRequiresAttentionView alloc] init];
        //A view controller requires user attention
        [vc viewControllerAtIndex:6 requiresUserAttentionWithImportanceLevel:1];
    } else if ([segue.identifier isEqualToString:@"InfiniteDisabledSegue"]) {
        M13InfiniteTabBarController *vc = segue.destinationViewController;
        display = @"InfiniteDisabledSegue";
        vc.delegate = self;
        vc.enableInfiniteScrolling = NO;
        //Set the requires user attention background
        vc.requiresAttentionBackgroundView = [[PulsingRequiresAttentionView alloc] init];
        //A view controller requires user attention
        [vc viewControllerAtIndex:6 requiresUserAttentionWithImportanceLevel:1];
    } else if ([segue.identifier isEqualToString:@"PinnedToTopSegue"]) {
        display = @"GreaterThan5Tabs";
        M13InfiniteTabBarController *vc = segue.destinationViewController;
        vc.tabBarPosition = M13InfiniteTabBarPositionTop;
        vc.delegate = self;
        //Set the requires user attention background
        vc.requiresAttentionBackgroundView = [[PulsingRequiresAttentionView alloc] init];
        //A view controller requires user attention
        [vc viewControllerAtIndex:6 requiresUserAttentionWithImportanceLevel:1];
    }
}

#pragma mark - M13InfiniteTabBarDelegate

- (NSArray *)infiniteTabBarControllerRequestingViewControllersToDisplay:(M13InfiniteTabBarController *)tabBarController
{
    //Load the view controllers from the storyboard and add them to the array.
    UIStoryboard *storyboard = self.storyboard;
    
    ViewController *vc1 = [storyboard instantiateViewControllerWithIdentifier:@"SundayVC"];
    ViewController *vc2 = [storyboard instantiateViewControllerWithIdentifier:@"MondayVC"];
    ViewController *vc3 = [storyboard instantiateViewControllerWithIdentifier:@"TuesdayVC"];
    ViewController *vc4 = [storyboard instantiateViewControllerWithIdentifier:@"WednesdayVC"];
    ViewController *vc5 = [storyboard instantiateViewControllerWithIdentifier:@"ThursdayVC"];
    ViewController *vc6 = [storyboard instantiateViewControllerWithIdentifier:@"FridayVC"];
   // UINavigationController *nc7 = [storyboard instantiateViewControllerWithIdentifier:@"NavigationVC"];
    ViewController *vc7 = [storyboard instantiateViewControllerWithIdentifier:@"SaturdayVC"];
   // [nc7 pushViewController:vc7 animated:NO];
    
    //------- setSelectedIndex: test --------
    
  /*  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Goto World Tab" forState:UIControlStateNormal];
    button.frame = CGRectMake(20, ([UIScreen mainScreen].bounds.size.height / 2.0) - 15, [UIScreen mainScreen].bounds.size.width - 40, 30);
    button.backgroundColor = [UIColor colorWithWhite:1 alpha:.3];
    [button addTarget:vc1 action:@selector(gotoWorld:) forControlEvents:UIControlEventTouchUpInside];
    [vc1.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"Goto Trash Tab" forState:UIControlStateNormal];
    button1.frame = CGRectMake(20, button.frame.origin.y + button.frame.size.height, [UIScreen mainScreen].bounds.size.width - 40, 30);
    button1.backgroundColor = [UIColor colorWithWhite:1 alpha:.3];
    [button1 addTarget:vc1 action:@selector(gotoTrash:) forControlEvents:UIControlEventTouchUpInside];
    [vc1.view addSubview:button1];
    
    vc1.infiniteTabBarController = tabBarController;
   
   */
    
    //------- end test ----------------------
    
    //You probably want to set this on the UIViewController initalization, from within the UIViewController subclass. I'm just doing it here since each tab inherits from the same subclass.
    [vc1 setInfiniteTabBarItem:[[M13InfiniteTabBarItem alloc] initWithTitle:@"Sunday" selectedIconMask:[UIImage imageNamed:@"" ] unselectedIconMask:[UIImage imageNamed:@""]]];
    [vc2 setInfiniteTabBarItem:[[M13InfiniteTabBarItem alloc] initWithTitle:@"Monday" selectedIconMask:[UIImage imageNamed:@""] unselectedIconMask:[UIImage imageNamed:@""]]];
    [vc3 setInfiniteTabBarItem:[[M13InfiniteTabBarItem alloc] initWithTitle:@"Tuesday" selectedIconMask:[UIImage imageNamed:@""] unselectedIconMask:[UIImage imageNamed:@""]]];
    [vc4 setInfiniteTabBarItem:[[M13InfiniteTabBarItem alloc] initWithTitle:@"Wednesday" selectedIconMask:[UIImage imageNamed:@""] unselectedIconMask:[UIImage imageNamed:@""]]];
    [vc5 setInfiniteTabBarItem:[[M13InfiniteTabBarItem alloc] initWithTitle:@"Thursday" selectedIconMask:[UIImage imageNamed:@""] unselectedIconMask:[UIImage imageNamed:@""]]];
    [vc6 setInfiniteTabBarItem:[[M13InfiniteTabBarItem alloc] initWithTitle:@"Friday" selectedIconMask:[UIImage imageNamed:@""] unselectedIconMask:[UIImage imageNamed:@""]]];
    [vc7 setInfiniteTabBarItem:[[M13InfiniteTabBarItem alloc] initWithTitle:@"Saturday" selectedIconMask:[UIImage imageNamed:@""] unselectedIconMask:[UIImage imageNamed:@""]]];
    
    //Done
    if ([display isEqualToString:@"LessThan5Tabs"]) {
        return @[vc1, vc2, vc3];
    } else if ([display isEqualToString:@"GreaterThan5Tabs"] || [display isEqualToString:@"InfiniteDisabledSegue"]) {
        return @[vc1, vc2, vc3, vc4, vc5, vc6, vc7];
    }
    return nil;
}

//Delegate Protocol
/* - (BOOL)infiniteTabBarController:(M13InfiniteTabBarController *)tabBarController shouldSelectViewContoller:(UIViewController *)viewController
{
    if ([viewController.title isEqualToString:@"Search"]) { //Prevent selection of first view controller
        return NO;
    } else {
        return YES;
    }
}



- (void)infiniteTabBarController:(M13InfiniteTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    //Do nothing
}

 
 */



- (IBAction)facebook:(id)sender {
    
    NSURL *fbURLWeb = [[NSURL alloc] initWithString:@"https://www.facebook.com/Dance-Excellence-116261978439678/"];
    

    NSURL *fbURLId = [[NSURL alloc] initWithString:@"fb://profile/116261978439678"];
    
    //checks for facebook app installation
    
    if([[UIApplication sharedApplication] canOpenURL:fbURLId]){
        
        //if FB app is installed
        [[UIApplication sharedApplication] openURL:fbURLId];
        
        
    }else{
    //opens web browser if fb application not installed
        
        [[UIApplication sharedApplication] openURL: fbURLWeb];
        
        
    }
    
}

- (IBAction)twitter:(id)sender {
    
    NSURL *tweetWeb = [[NSURL alloc] initWithString:@"https://twitter.com/danceexcellence"];
    
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?id=1262677130"]]){
        
        [[UIApplication sharedApplication] openURL:tweetWeb];
        
        
        
        
    }else{
        
        [[UIApplication sharedApplication] openURL:tweetWeb];
    
    
    
    }
    
    
    
}

- (IBAction)instagram:(id)sender {


    NSURL *instagramURL = [NSURL URLWithString:@"instagram://user?id=2256863879"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
    
    



}

/*

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BOOL fbCellIsPressed =
    
    if(fbcell)
        [self buttonPressed];
    
    
    
    
    
    
    
}
*/






@end
    

