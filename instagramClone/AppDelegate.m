//
//  AppDelegate.m
//  instagramClone
//
//  Created by Mr Ruby on 22/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SearchViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@property (nonatomic) UITabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil]];
    
    ViewController *viewController1 = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] ;
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
    
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
