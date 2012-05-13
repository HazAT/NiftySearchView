//
//  SearchView.h
//  NiftySearchView
//
//  Created by Daniel Griesser on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol NiftySearchViewDelegate;
@interface NiftySearchView : UIView

@property (nonatomic, assign) id <NiftySearchViewDelegate> delegate;
@property (nonatomic, retain) UITextField *startTextField;
@property (nonatomic, retain) UITextField *finishTextField;

@end

@protocol NiftySearchViewDelegate <NSObject>
- (void)startBookmarkButtonClicked:(UITextField *)textField;
- (void)finishBookmarkButtonClicked:(UITextField *)textField;
- (void)routeButtonClicked:(UITextField *)startTextField finishTextField:(UITextField *)finishTextField;
- (void)niftySearchViewResigend;
@end