//
// UIView+AutoLayout.h
// ADAutoLayout
//
// Created by Aksel Dybdal on 09.02.14.
// Copyright (c) 2014 Aksel Dybdal.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

/**
 ADAutoLayout enables Auto Layout constanst to be used as properties.
 
 ## Notes
 
 For now, ADAutoLayout supports only height, width, top, bottom, leading and trailing constants without any support for priority, hugging or compression resistance.
 **/

@interface UIView (AutoLayout)

///-----------------
/// @name Properties
///-----------------

/**
 Property for accessing and setting height contraint constant.
 */
@property (nonatomic, assign) CGFloat constantHeight;

/**
 Property for accessing and setting width contraint constant.
 */
@property (nonatomic, assign) CGFloat constantWidth;

/**
 Property for accessing and setting top contraint constant.
 */
@property (nonatomic, assign) CGFloat constantTop;

/**
 Property for accessing and setting bottom contraint constant.
 */
@property (nonatomic, assign) CGFloat constantBottom;

/**
 Property for accessing and setting leading contraint constant.
 */
@property (nonatomic, assign) CGFloat constantLeading;

/**
 Property for accessing and setting trailing contraint constant.
 */
@property (nonatomic, assign) CGFloat constantTrailing;

@end
