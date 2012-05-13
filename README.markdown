# NiftySearchView

This project aims to replicate the search interface of the Google Maps App.

The repo includes an example project so you can see how it works.
Short ... it's just a simple UIView

![](https://github.com/HazAT/NiftySearchView/raw/master/screenshot01.png)

Basic usage is as follows:

	NiftySearchView *searchView = [[NiftySearchView alloc] initWithFrame:CGRectMake(0, -76, 320, 76)];
	searchView.delegate = (id)self;
	[self.view addSubview:searchView];

Also uses a delegate protocol for all view actions

	@protocol NiftySearchViewDelegate <NSObject>
	- (void)startBookmarkButtonClicked:(UITextField *)textField;
	- (void)finishBookmarkButtonClicked:(UITextField *)textField;
	- (void)routeButtonClicked:(UITextField *)startTextField finishTextField:(UITextField *)finishTextField;
	- (void)niftySearchViewResigend;
	@end

# Requirements:

 * iOS5 or above
 * Automatic Reference Counting