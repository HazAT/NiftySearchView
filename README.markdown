# NiftySearchView

This project aims to replicate the search interface of the Google Maps App.

The NiftySearchView is in an example project so you can see how it works.
It's just a simple UIView

![](https://github.com/HazAT/NiftySearchView/raw/master/screenshot01.png)

Currently includes a sample Universal project that will run on iPad and iPhone.  Basic usage is as follows:

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