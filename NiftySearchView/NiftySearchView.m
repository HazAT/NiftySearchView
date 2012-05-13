//
//  SearchView.m
//  NiftySearchView
//
//  Created by Daniel Griesser on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NiftySearchView.h"

@implementation NiftySearchView

@synthesize startTextField;
@synthesize finishTextField;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        startTextField = [[UITextField  alloc] initWithFrame:CGRectMake(0,7, frame.size.width, 25)];
		startTextField.borderStyle = UITextBorderStyleRoundedRect;
        startTextField.bounds = CGRectMake(0, 0, frame.size.width - 20, 31);
        startTextField.returnKeyType = UIReturnKeyNext;
        startTextField.layer.cornerRadius = 10.0;
        startTextField.layer.borderColor = [UIColor darkGrayColor].CGColor;
        startTextField.layer.borderWidth = 1.0;
        startTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        startTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        startTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        startTextField.text = NSLocalizedString(@"Current Location", nil);
        startTextField.delegate = (id)self;


        UIButton *bookmark = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 29)];
        [bookmark setImage:[UIImage imageNamed:@"UISearchBarBookmarks"] forState:UIControlStateNormal];
        [bookmark setImage:[UIImage imageNamed:@"UISearchBarBookmarksPressed"] forState:UIControlStateHighlighted];
        [bookmark addTarget:self action:@selector(startBookmarkButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        startTextField.rightViewMode = UITextFieldViewModeUnlessEditing;
        startTextField.rightView = bookmark;
        startTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        UILabel *preText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 35, 29)];
        preText.text = NSLocalizedString(@"Start:", nil);
        preText.backgroundColor = [UIColor clearColor];
        preText.textColor = [UIColor grayColor];
        preText.font = [UIFont systemFontOfSize:12];
        startTextField.leftViewMode = UITextFieldViewModeAlways;
        startTextField.leftView = preText;
        
        [self addSubview:startTextField];
        
        finishTextField = [[UITextField  alloc] initWithFrame:CGRectMake(0, 42, frame.size.width, 25)];
		finishTextField.borderStyle = UITextBorderStyleRoundedRect;
        finishTextField.bounds = CGRectMake(0, 0, frame.size.width - 20, 31);
        finishTextField.returnKeyType = UIReturnKeyRoute;
        finishTextField.layer.cornerRadius = 10.0;
        finishTextField.layer.borderColor = [UIColor darkGrayColor].CGColor;
        finishTextField.layer.borderWidth = 1.0;
        finishTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        finishTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        finishTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        finishTextField.delegate = (id)self;
        
        UIButton *bookmarkTarget = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 29)];
        [bookmarkTarget setImage:[UIImage imageNamed:@"UISearchBarBookmarks"] forState:UIControlStateNormal];
        [bookmarkTarget setImage:[UIImage imageNamed:@"UISearchBarBookmarksPressed"] forState:UIControlStateHighlighted];
        [bookmarkTarget addTarget:self action:@selector(finishBookmarkButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        finishTextField.rightViewMode = UITextFieldViewModeUnlessEditing;
        finishTextField.rightView = bookmarkTarget;
        finishTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        UILabel *preTextFinish = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 35, 29)];
        preTextFinish.text = NSLocalizedString(@"Dest.:", nil);
        preTextFinish.backgroundColor = [UIColor clearColor];
        preTextFinish.textColor = [UIColor grayColor];
        preTextFinish.font = [UIFont systemFontOfSize:12];
        finishTextField.leftViewMode = UITextFieldViewModeAlways;
        finishTextField.leftView = preTextFinish;
        [self addSubview:finishTextField];
    }
    return self;
}

-(void) startBookmarkButtonClicked:(id)sender 
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(startBookmarkButtonClicked:)]) {
        [self.delegate startBookmarkButtonClicked:startTextField];
    }
}

-(void) finishBookmarkButtonClicked:(id)sender 
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(finishBookmarkButtonClicked:)]) {
        [self.delegate finishBookmarkButtonClicked:finishTextField];
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string 
{
    NSRange myRange = [textField.text rangeOfString:NSLocalizedString(@"Current Location", nil) options:NSCaseInsensitiveSearch];
    if (myRange.location != NSNotFound) {
        [textField setText:@""];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    if (textField == startTextField) {
        [finishTextField becomeFirstResponder];
        return FALSE;
    } else if (textField == finishTextField) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(routeButtonClicked:finishTextField:)]) {
            [self.startTextField resignFirstResponder];
            [self.finishTextField resignFirstResponder];
            if (self.delegate && [self.delegate respondsToSelector:@selector(niftySearchViewResigend)]) {
                [self.delegate niftySearchViewResigend];
            }
            [self.delegate routeButtonClicked:startTextField finishTextField:finishTextField];
        }
    }
    return TRUE;
}

-(void) addGradient:(UIButton *) _button 
{
    // Add Border
    CALayer *layer = _button.layer;
    layer.cornerRadius = 8.0f;
    layer.masksToBounds = YES;
    layer.borderWidth = 1.0f;
    layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.2f].CGColor;
    
    // Add Shine
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [layer addSublayer:shineLayer];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 1.0, 0.35,  // Start color
        1.0, 1.0, 1.0, 0.06 }; // End color
    
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
    
    CGRect currentBounds = self.bounds;
    CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
    CGPoint midCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
    CGContextDrawLinearGradient(currentContext, glossGradient, topCenter, midCenter, 0);
    
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace); 
}


@end
