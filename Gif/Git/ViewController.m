//
//  ViewController.m
//  Git
//
//  Created by quanminqianbao on 2018/1/31.
//  Copyright © 2018年 yangshuquan. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+LoadGif.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)git:(id)sender {
    [self showGif];
    
}

- (IBAction)hide:(id)sender {
    [self hideGif];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
