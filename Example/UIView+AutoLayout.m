//
// UIView+AutoLayout.m
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

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)

#pragma mark - Getters

- (CGFloat)constantHeight
{
    return [self autoLayoutConstantForAttribute:NSLayoutAttributeHeight];
}

- (CGFloat)constantWidth
{
    return [self autoLayoutConstantForAttribute:NSLayoutAttributeWidth];
}

- (CGFloat)constantTop
{
    return [self autoLayoutConstantForAttribute:NSLayoutAttributeTop];
}

- (CGFloat)constantBottom
{
    return [self autoLayoutConstantForAttribute:NSLayoutAttributeBottom];
}

- (CGFloat)constantLeading
{
    return [self autoLayoutConstantForAttribute:NSLayoutAttributeLeading];
}

- (CGFloat)constantTrailing
{
    return [self autoLayoutConstantForAttribute:NSLayoutAttributeTrailing];
}


#pragma mark - Setters

- (void)setConstantHeight:(CGFloat)constantHeight
{
    [self autoLayoutNewConstant:constantHeight forAttribute:NSLayoutAttributeHeight];
}

- (void)setConstantWidth:(CGFloat)constantWidth
{
    [self autoLayoutNewConstant:constantWidth forAttribute:NSLayoutAttributeWidth];
}

- (void)setConstantTop:(CGFloat)constantTop
{
    [self autoLayoutNewConstant:constantTop forAttribute:NSLayoutAttributeTop];
}

- (void)setConstantBottom:(CGFloat)constantBottom
{
    [self autoLayoutNewConstant:constantBottom forAttribute:NSLayoutAttributeBottom];
}

- (void)setConstantLeading:(CGFloat)constantLeading
{
    [self autoLayoutNewConstant:constantLeading forAttribute:NSLayoutAttributeLeading];
}

- (void)setConstantTrailing:(CGFloat)constantTrailing
{
    [self autoLayoutNewConstant:constantTrailing forAttribute:NSLayoutAttributeTrailing];
}


#pragma mark - AutoLayout private

- (void)autoLayoutNewConstant:(CGFloat)constant forAttribute:(NSLayoutAttribute)attribute
{
    BOOL found = NO;
    
    if (attribute == NSLayoutAttributeHeight || attribute == NSLayoutAttributeWidth) {
        for (NSLayoutConstraint *constraint in self.constraints) {
            if (constraint.firstItem == self && constraint.firstAttribute == attribute) {
                constraint.constant = constant;
                found = YES;
                break;
            }
        }
    } else {
        for (NSLayoutConstraint *constraint in self.superview.constraints) {
            if (constraint.firstItem == self && constraint.firstAttribute == attribute) {
                constraint.constant = constant;
                found = YES;
                break;
            }
        }
    }
    
    if (NO == found) {
        if (attribute == NSLayoutAttributeHeight || attribute == NSLayoutAttributeWidth) {
            NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                          attribute:attribute
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:0
                                                                         multiplier:0
                                                                           constant:constant];
            [self addConstraint:constraint];
        } else {
            NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                          attribute:attribute
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.superview
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0
                                                                           constant:constant];
            [self.superview addConstraint:constraint];
        }
    }
}

- (CGFloat)autoLayoutConstantForAttribute:(NSLayoutAttribute)attribute
{
    CGFloat constant = 0.0f;
    
    if (attribute == NSLayoutAttributeHeight || attribute == NSLayoutAttributeWidth) {
        for (NSLayoutConstraint *constraint in self.constraints) {
            if (constraint.firstItem == self && constraint.firstAttribute == attribute) {
                constant = constraint.constant;
                break;
            }
        }
    } else {
        for (NSLayoutConstraint *constraint in self.superview.constraints) {
            if (constraint.firstItem == self && constraint.firstAttribute == attribute) {
                constant = constraint.constant;
                break;
            }
        }
    }
    
    return constant;
}

@end
