//
//  MainViewController.m
//  instagramClone
//
//  Created by alisha bhatia on 24/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

- (IBAction)mailClicked:(id)sender;
- (IBAction)addClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

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

- (IBAction)mailClicked:(id)sender {
    [self.delegate goToMessageFromMainClicked];

}

- (IBAction)addClicked:(id)sender {
    [self.delegate goToStoryFromMainClicked];

}
@end
