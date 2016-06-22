//
//  BouncePresentAnimation.m
//  AJTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/21.
//  Copyright © 2016年 DreamAJ. All rights reserved.
//

#import "BouncePresentAnimation.h"

@implementation BouncePresentAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    CGRect finalFrames = CGRectMake(0, 0, finalFrame.size.width, finalFrame.size.height);
    
    toVC.view.frame = CGRectMake(0, screenBounds.size.height, screenBounds.size.width, screenBounds.size.height);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = finalFrames;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    
}



@end
