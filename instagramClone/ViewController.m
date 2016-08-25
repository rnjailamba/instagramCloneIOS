//
//  ViewController.m
//  instagramClone
//
//  Created by Mr Ruby on 22/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "ViewController.h"
#import "StoryViewController.h"
#import "MainViewController.h"
#import "MessageViewController.h"


@interface ViewController () <UIPageViewControllerDataSource >

@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) MainViewController *mainVC;
@property (strong, nonatomic) StoryViewController *storyVC;
@property (strong, nonatomic) MessageViewController *messageVC;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [[UIScreen mainScreen] bounds ];
    self.mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.storyVC = [[StoryViewController alloc] initWithNibName:@"StoryViewController" bundle:nil];
    self.messageVC = [[MessageViewController alloc] initWithNibName:@"MessageViewController" bundle:nil];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    NSArray *viewControllers = [NSArray arrayWithObject:self.mainVC];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if(viewController == self.mainVC){
        return self.storyVC;
    }
    else if (viewController == self.messageVC){
        return self.mainVC;
    }
    else{
        return nil;
    }
    
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    if(viewController == self.mainVC){
        return self.messageVC;
    }
    else if (viewController == self.storyVC){
        return self.mainVC;
    }
    else{
        return nil;
    }
    
    
}

//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
//    // The number of items reflected in the page indicator.
//    return 3;
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    // The selected item reflected in the page indicator.
//    return 0;
//}

@end
