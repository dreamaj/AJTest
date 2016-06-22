//
//  ViewController.m
//  AJTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/21.
//  Copyright © 2016 DreamAJ. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"
#import "BouncePresentAnimation.h"
#import "SwipeUpInteractiveTransition.h"
#import "NormalDismissAnimation.h"

@interface ViewController ()<ModalViewControllerDelegate,UIViewControllerTransitioningDelegate>

@property(nonatomic, strong)BouncePresentAnimation *presentAnimation;
@property(nonatomic, strong)NormalDismissAnimation *dismissAnimation;
@property (nonatomic, strong) SwipeUpInteractiveTransition *transitionController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _presentAnimation = [BouncePresentAnimation new];
        _dismissAnimation = [NormalDismissAnimation new];
        _transitionController = [SwipeUpInteractiveTransition new];
    }
    return self;

}



- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{

    return self.presentAnimation;

}

-(void)buttonClicked:(id)sender{
    ModalViewController *modal = [[ModalViewController alloc] init];
    modal.transitioningDelegate = self;
    modal.delegate = self;
    [self.transitionController wireToViewController:modal];
    [self presentViewController:modal animated:YES completion:nil];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{

    return self.dismissAnimation;

}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}

-(void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController{

    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
