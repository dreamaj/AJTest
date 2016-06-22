//
//  NormalDismissAnimation.m
//  AJTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/21.
//  Copyright © 2016 DreamAJ. All rights reserved.
//

#import "NormalDismissAnimation.h"

@implementation NormalDismissAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
//    
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    
//    CGRect screenBounds = [[UIScreen mainScreen] bounds];
//    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
//    CGRect finalFrames = CGRectMake(0, 0, finalFrame.size.width, finalFrame.size.height);
//    
//    toVC.view.frame = finalFrames;
//   
//    
//    UIView *containerView = [transitionContext containerView];
//    [containerView addSubview:toVC.view];
//    
//    NSTimeInterval duration = [self transitionDuration:transitionContext];
//    
//    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        toVC.view.frame =  CGRectMake(0, screenBounds.size.height, screenBounds.size.width, screenBounds.size.height);
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:YES];
//    }];
    
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for fromVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);
    
    // 3. Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end
