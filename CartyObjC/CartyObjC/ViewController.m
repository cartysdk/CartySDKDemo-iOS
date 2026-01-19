//
//  ViewController.m
//  CartyObjC
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

#import "ViewController.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (@available(iOS 14, *))
    {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CartySDK";
    // Do any additional setup after loading the view.
}


@end
