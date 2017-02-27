//
//  ViewController.m
//  M13InfiniteTabBar
//
//  Created by Brandon McQuilkin on 2/13/13.
//  Copyright (c) 2013 Brandon McQuilkin. All rights reserved.
//

#import "ViewController.h"
#import "M13InfiniteTabBarController.h"
#import "M13InfiniteTabBarItem.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [myScrollview setScrollEnabled:YES];
    [myScrollview setContentSize: CGSizeMake(320, 1300)];
    
    
    [mondayScrollView setScrollEnabled:YES];
    [mondayScrollView setContentSize: CGSizeMake(320, 4870)];
    
    [tuesdayScrollView setScrollEnabled:YES];
    [tuesdayScrollView setContentSize:CGSizeMake(320, 3650)];
    
    [wednesdayScrollView setScrollEnabled:YES];
    [wednesdayScrollView setContentSize:CGSizeMake(320, 3450)];
    
    [thursdayScrollView setScrollEnabled:YES];
    [thursdayScrollView setContentSize:CGSizeMake(320, 1000)];
    
    [fridayScrollView setScrollEnabled:YES];
    [fridayScrollView setContentSize:CGSizeMake(320, 1200)];
    
    [saturdayScrollView setScrollEnabled:NO];
    [saturdayScrollView setContentSize:CGSizeMake(320, 1000)];
    
    [goodiesScrollView setScrollEnabled:YES];
    [goodiesScrollView setContentSize:CGSizeMake(320, 3900)];
    
    
    
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"ViewWillApear: %@", self.title);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"ViewDidAppear: %@", self.title);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"ViewWillDisappear: %@", self.title);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"ViewDidDisappear: %@", self.title);
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (IBAction)testView:(id)sender
{
    UITextView *testView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,140,140)];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"before after"];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"D-Va.png"];
    
    CGFloat oldWidth = textAttachment.image.size.width;
    
    //I'm subtracting 10px to make the image display nicely, accounting
    //for the padding inside the textView
    CGFloat scaleFactor = oldWidth / (testView.frame.size.width - 10);
    textAttachment.image = [UIImage imageWithCGImage:textAttachment.image.CGImage scale:scaleFactor orientation:UIImageOrientationUp];
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedString replaceCharactersInRange:NSMakeRange(6, 1) withAttributedString:attrStringWithImage];
    testView.attributedText = attributedString;


}

- (void)gotoWorld:(id)sender
{
    //Need to check how many view controllers we have.
    if (self.infiniteTabBarController.viewControllers.count >= 4) {
        [self.infiniteTabBarController setSelectedIndex:4];
    } else {
        [self.infiniteTabBarController setSelectedIndex:2];
    }
    
}

- (void)gotoTrash:(id)sender
{
    //Need to check how many view controllers we have.
    if (self.infiniteTabBarController.viewControllers.count >= 4) {
        [self.infiniteTabBarController setSelectedIndex:6];
    } else {
        //Does not exist.
    }
}

@end
