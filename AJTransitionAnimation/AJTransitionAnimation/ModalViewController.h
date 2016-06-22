//
//  ModalViewController.h
//  AJTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/21.
//  Copyright © 2016年 DreamAJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalViewController;

@protocol ModalViewControllerDelegate <NSObject>

-(void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController;

@end

@interface ModalViewController : UIViewController

@property(nonatomic,weak)id <ModalViewControllerDelegate> delegate;

@end
