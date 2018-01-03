//
//  ViewController.m
//  BassLine
//
//  Created by 林兴栋 on 2017/12/25.
//  Copyright © 2017年 林兴栋. All rights reserved.
//

#import "ViewController.h"
#import "BassLine-Swift.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)pushSecondVC:(UIButton *)sender {
    SecondViewController * sVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"SecondViewController"];
//    SecondViewController * sVC = [SecondViewController new];
    [self.navigationController pushViewController:sVC animated:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
