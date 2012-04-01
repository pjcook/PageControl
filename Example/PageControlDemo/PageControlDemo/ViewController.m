//
//  ViewController.m
//  PageControlDemo
//
//  Created by PJ Cook on 01/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

@synthesize pageControl;
@synthesize fakePageButtons;

- (void)viewDidLoad
{
    [super viewDidLoad];

	//self.pageControl = [[PageControl alloc] initWithFrame:CGRectMake(356, 414, 56, 36)];
	pageControl.image = [UIImage imageNamed:@"dot.png"];
	pageControl.selectedImage = [UIImage imageNamed:@"dot-selected.png"];
	pageControl.padding = 6.0f;
	pageControl.orientation = PageControlOrientationPortrait;
	pageControl.numberOfPages = fakePageButtons.count;  // Set the number of pages last :)
	[self.view addSubview:pageControl];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)fakePageTurn:(id)sender
{
	pageControl.currentPage = ((UIButton *)sender).tag;
}

@end
