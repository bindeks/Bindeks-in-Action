//
//  UIViewController+BBBOuterView.m
//  GoodCards
//
//  Created by Volodymyr Khmil on 10/28/16.
//  Copyright © 2016 GoodCards. All rights reserved.
//

#import "UIViewController+BindeksOuterView.h"
#import <objc/runtime.h>
#import "UIView+BBBPlaceWithConstraint.h"

@implementation UIViewController(BindeksOuterView)

@dynamic BDK_outerView;

- (void)setBDK_outerView:(UIView*)BDK_outerView {
    [self.BDK_outerView removeFromSuperview];
    [self.view insertSubview:BDK_outerView atIndex:0];
    [self.view addConstraints:[UIView placeView:BDK_outerView onOtherView:self.view]];
    objc_setAssociatedObject(self, @selector(BDK_outerView), BDK_outerView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView*)BDK_outerView {
    return objc_getAssociatedObject(self, @selector(BDK_outerView));
}


@end
