//
//  MainParentViewController.m
//  instagramClone
//
//  Created by Mr Ruby on 31/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "MainParentViewController.h"
#import "MainViewController.h"
#import "SearchViewController.h"
#import "ViewController.h"

@interface MainParentViewController ()<UITabBarControllerDelegate>

@property (nonatomic) UITabBarController *tabBarController;

@end

@implementation MainParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [[UIScreen mainScreen] bounds];
    MainViewController *viewController1 = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil] ;
    SearchViewController *viewController2 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    SearchViewController *viewController3 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    SearchViewController *viewController4 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    SearchViewController *viewController5 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    
    UINavigationController *navigationController1=[[UINavigationController alloc]initWithRootViewController:viewController1];
    UINavigationController *navigationController2=[[UINavigationController alloc]initWithRootViewController:viewController2];
    UINavigationController *navigationController3=[[UINavigationController alloc]initWithRootViewController:viewController3];
    UINavigationController *navigationController4=[[UINavigationController alloc]initWithRootViewController:viewController4];
    UINavigationController *navigationController5=[[UINavigationController alloc]initWithRootViewController:viewController5];
    
    [navigationController1.navigationBar setHidden:YES];
    [navigationController2.navigationBar setHidden:YES];
    [navigationController3.navigationBar setHidden:YES];
    [navigationController4.navigationBar setHidden:YES];
    [navigationController5.navigationBar setHidden:YES];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    [self.tabBarController.tabBar setBackgroundColor:[UIColor clearColor]];
    self.tabBarController.viewControllers = @[navigationController1, navigationController2,navigationController3,navigationController4,navigationController5];
    
    [[self.tabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"home.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"search.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"cam.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"love.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:4] setImage:[UIImage imageNamed:@"person.png"]];
    [[self.tabBarController.tabBar.items objectAtIndex:0] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    [[self.tabBarController.tabBar.items objectAtIndex:1] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    [[self.tabBarController.tabBar.items objectAtIndex:2] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    [[self.tabBarController.tabBar.items objectAtIndex:3] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    [[self.tabBarController.tabBar.items objectAtIndex:4] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    
    [self addChildViewController:self.tabBarController];
    [[self view] addSubview:[self.tabBarController view]];
    [self.tabBarController didMoveToParentViewController:self];
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

@end
