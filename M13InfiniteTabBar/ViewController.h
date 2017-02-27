//
//  ViewController.h
//  M13InfiniteTabBar
//
//  Created by Brandon McQuilkin on 2/13/13.
//  Copyright (c) 2013 Brandon McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class M13InfiniteTabBarController;

@interface ViewController : UIViewController { IBOutlet UIScrollView *myScrollview;
    IBOutlet UIScrollView *mondayScrollView;
    IBOutlet UIScrollView *tuesdayScrollView;
    IBOutlet UIScrollView *wednesdayScrollView;
    IBOutlet UIScrollView *thursdayScrollView;
    IBOutlet UIScrollView *fridayScrollView;
    IBOutlet UIScrollView *saturdayScrollView;
    IBOutlet UIScrollView *goodiesScrollView;
    
    IBOutlet UITextView *testView;

    

    
    
}

@property (retain, nonatomic) IBOutlet UITextView *testView;



@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) M13InfiniteTabBarController *infiniteTabBarController;

- (IBAction)testView:(id)sender;

- (IBAction)gotoWorld:(id)sender;
- (IBAction)gotoTrash:(id)sender;

@end
