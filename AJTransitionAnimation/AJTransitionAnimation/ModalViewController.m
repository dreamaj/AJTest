//
//  ModalViewController.m
//  AJTransitionAnimation
//
//  Created by JBZ－IOS on 16/6/21.
//  Copyright © 2016 DreamAJ. All rights reserved.
//

#import "ModalViewController.h"
#import "ViewController.h"
#import "BouncePresentAnimation.h"

@interface ModalViewController ()<UIViewControllerTransitioningDelegate>



@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80, 210, 160, 40);
    [button setTitle:@"Dismiss me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

-(void)buttonClicked:(id)sender{
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDidClickedDismissButton:)]) {
        [self.delegate modalViewControllerDidClickedDismissButton:self];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
