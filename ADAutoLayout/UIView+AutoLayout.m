//
//  UIView+AutoLayout.m
//  DigitalRutebok
//
//  Created by Aksel Dybdal on 05.02.14.
//  Copyright (c) 2014 Posten. All rights reserved.
//

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
