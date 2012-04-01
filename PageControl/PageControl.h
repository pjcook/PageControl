//
//  PageControl.h
//
//  PageControl
//	Version 1.0.0
//
//  Created by PJ Cook on 01/04/2012.
//  Copyright (c) 2012 Software101. All rights reserved.
//
//  Distributed under the permissive zlib License
//  Get the latest version from either of this location:
//
//  https://github.com/pjcook/PageControl
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import <UIKit/UIKit.h>

typedef enum {
	PageControlOrientationPortrait,
	PageControlOrientationLandscape,
} PageControlOrientation;

@interface PageControl : UIView

@property (nonatomic, strong) IBOutlet UIImage *image;
@property (nonatomic, strong) IBOutlet UIImage *selectedImage;
@property (nonatomic, strong) UIColor *backgroundHighlightColor;
@property (nonatomic, assign) BOOL shouldRoundBackgroundCorners;
@property (nonatomic, assign) PageControlOrientation orientation;
@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) CGFloat padding;

@end
