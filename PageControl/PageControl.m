//
//  PageControl.m
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

#import "PageControl.h"

@interface PageControl()

@property (nonatomic, strong) NSMutableArray *pages;

- (void)layoutControls;
- (void)setup;

@end

@implementation PageControl

@synthesize image = _image;
@synthesize selectedImage = _selectedImage;
@synthesize backgroundHighlightColor = _backgroundHighlightColor;
@synthesize shouldRoundBackgroundCorners = _shouldRoundBackgroundCorners;
@synthesize orientation = _orientation;
@synthesize numberOfPages = _numberOfPages;
@synthesize currentPage = _currentPage;
@synthesize padding = _padding;
@synthesize pages;

- (id)init
{
	self = [super init];
	if (self) 
	{
		[self setup];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) 
	{
		[self setup];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) 
	{
		[self setup];
	}
	return self;
}

- (void)setImage:(UIImage *)image
{
	_image = image;
	[self layoutControls];
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
	_selectedImage = selectedImage;
	[self layoutControls];
}

- (void)setBackgroundHighlightColor:(UIColor *)backgroundHighlightColor
{
	_backgroundHighlightColor = backgroundHighlightColor;
	self.backgroundColor = backgroundHighlightColor;
	[self layoutControls];
}

- (void)setShouldRoundBackgroundCorners:(BOOL)shouldRoundBackgroundCorners
{
	_shouldRoundBackgroundCorners = shouldRoundBackgroundCorners;
	[self layoutControls];
}

- (void)setOrientation:(PageControlOrientation)orientation
{
	_orientation = orientation;
	[self layoutControls];
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
	_numberOfPages = numberOfPages;
	[self layoutControls];
}

- (void)setPadding:(CGFloat)padding
{
	_padding = padding;
	[self layoutControls];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
	if (currentPage < 0 && currentPage >= _numberOfPages) return;
	
	_currentPage = currentPage;
	for (UIImageView *v in pages) 
	{
		v.highlighted = v.tag == currentPage;
	}
}

- (void)setup
{
	self.backgroundColor = [UIColor clearColor];
	_orientation  = PageControlOrientationLandscape;
	_numberOfPages = 0;
	_currentPage = 0;
	_padding = 0.0f;
}

- (void)layoutControls
{
	// clear existing content
	for (UIView *v in self.subviews) 
	{
		[v removeFromSuperview];
	}
	
	// calculate size of control
	CGRect mainFrame = self.frame;
	if (_numberOfPages <= 0)
	{
		return;
	}
	else if (_orientation == PageControlOrientationLandscape)
	{
		mainFrame.size.height = _image.size.height + (2 * _padding);
		mainFrame.size.width = _image.size.width * _numberOfPages + (_padding * (_numberOfPages + 2));
		mainFrame.origin.x = floor((mainFrame.origin.x + (self.frame.size.width / 2.0f)) - mainFrame.size.width / 2.0f);
	}
	else 
	{
		mainFrame.size.width = _image.size.height + (2 * _padding);
		mainFrame.size.height = _image.size.width * _numberOfPages + (_padding * (_numberOfPages + 2));
		mainFrame.origin.y = floor((mainFrame.origin.y + (self.frame.size.height / 2.0f)) - mainFrame.size.height / 2.0f);
	}
		
	self.frame = mainFrame;	
	
	self.pages = nil;
	self.pages = [NSMutableArray arrayWithCapacity:_numberOfPages];
	
	for (int i=0; i < _numberOfPages; i++) 
	{
		UIImageView *page = [[UIImageView alloc] initWithImage:_image highlightedImage:_selectedImage == nil ? _image : _selectedImage];
		page.tag = i;
		page.highlighted = page.tag == _currentPage;
		[pages addObject:page];
	}
	
	CGPoint position = CGPointZero;
	if (_orientation == PageControlOrientationLandscape)
	{
		position.x += _padding;
		for (UIView *v in pages) 
		{
			CGRect rect = v.frame;
			rect.origin = position;
			v.frame = rect;
			position.x += rect.size.width + _padding;
			[self addSubview:v];
		}
	}
	else 
	{
		position.y += _padding;
		for (UIView *v in pages) 
		{
			CGRect rect = v.frame;
			rect.origin = position;
			v.frame = rect;
			position.y += rect.size.width + _padding;
			[self addSubview:v];
		}
	}
	[self setNeedsDisplay];
}

@end
