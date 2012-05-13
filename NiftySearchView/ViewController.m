//
//  ViewController.m
//  NiftySearchView
//
//  Created by Daniel Griesser on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    searchView = [[NiftySearchView alloc] initWithFrame:CGRectMake(0, -76, 320, 76)];
    searchView.delegate = (id)self;
    [self.view addSubview:searchView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)showNiftySearchView:(id)sender
{
    if ([searchView.startTextField.text isEqualToString:NSLocalizedString(@"Current Location", nil)]) {
        searchView.startTextField.textColor = [UIColor blueColor];
    } else {
        searchView.startTextField.textColor = [UIColor blackColor];
    }
    if ([searchView.finishTextField.text isEqualToString:NSLocalizedString(@"Current Location", nil)]) {
        searchView.finishTextField.textColor = [UIColor blueColor];
    } else {
        searchView.finishTextField.textColor = [UIColor blackColor];
    }

    CGRect searchBarFrame = searchView.frame;
    searchBarFrame.origin.y = 0;
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut 
                     animations:^{
                         searchView.frame = searchBarFrame;
                     }
                     completion:^(BOOL completion) {
                        [searchView.startTextField becomeFirstResponder];
                     }];
}

#pragma mark -
#pragma mark NiftySearchView Delegate Methods

- (void)startBookmarkButtonClicked:(UITextField *)textField 
{
    NSLog(@"startBookmarkButtonClicked");
}
- (void)finishBookmarkButtonClicked:(UITextField *)textField 
{
    NSLog(@"finishBookmarkButtonClicked");
}

- (void)niftySearchViewResigend 
{
    NSLog(@"resignSearchView");
    [self hideSearchBar:self];
}

- (void)routeButtonClicked:(UITextField *)startTextField finishTextField:(UITextField *)finishTextField 
{
    NSLog(@"routeButtonClicked");
}

- (IBAction)hideSearchBar:(id)sender 
{
    [searchView.startTextField resignFirstResponder];
    [searchView.finishTextField resignFirstResponder];
    CGRect searchBarFrame = searchView.frame;
    searchBarFrame.origin.y = -76;
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut 
                     animations:^{
                         searchView.frame = searchBarFrame;
                     }
                     completion:^(BOOL completion){
                         
                     }];
}


@end
