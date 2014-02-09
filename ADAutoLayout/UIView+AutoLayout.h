//
//  UIView+AutoLayout.h
//  DigitalRutebok
//
//  Created by Aksel Dybdal on 05.02.14.
//  Copyright (c) 2014 Posten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AutoLayout)

@property (nonatomic, assign) CGFloat constantHeight;
@property (nonatomic, assign) CGFloat constantWidth;
@property (nonatomic, assign) CGFloat constantTop;
@property (nonatomic, assign) CGFloat constantBottom;
@property (nonatomic, assign) CGFloat constantLeading;
@property (nonatomic, assign) CGFloat constantTrailing;

@end
