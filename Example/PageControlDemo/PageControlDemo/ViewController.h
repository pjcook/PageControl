//
//  ViewController.h
//  PageControlDemo
//
//  Created by PJ Cook on 01/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageControl.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet PageControl *pageControl;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *fakePageButtons;

- (IBAction)fakePageTurn:(id)sender;

@end
