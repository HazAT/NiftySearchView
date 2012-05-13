//
//  ViewController.h
//  NiftySearchView
//
//  Created by Daniel Griesser on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NiftySearchView.h"

@interface ViewController : UIViewController <NiftySearchViewDelegate> {
    NiftySearchView *searchView;
}

@end
