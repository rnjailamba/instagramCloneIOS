//
//  MessageViewController.m
//  instagramClone
//
//  Created by alisha bhatia on 24/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()
- (IBAction)plusClicked:(id)sender;
- (IBAction)leftClicked:(id)sender;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [[UIScreen mainScreen] bounds];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)plusClicked:(id)sender {
}
@end
