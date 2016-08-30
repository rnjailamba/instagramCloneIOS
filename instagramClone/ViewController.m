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
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>

#define flickrApiKey @"801b80fc0b9d4eb71a6ffc414c4b1304"

@interface ViewController () <UIPageViewControllerDataSource, StoryViewDelegate, MainViewControllerDelegate, MessageViewControllerDelegate >

@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) MainViewController *mainVC;
@property (strong, nonatomic) StoryViewController *storyVC;
@property (strong, nonatomic) MessageViewController *messageVC;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [[UIScreen mainScreen] bounds ];
    [self setUpViews];
    [self setUpPageViewControllerToOpenToMain];
    [self getData];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)getData{
//
//URL: https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=801b80fc0b9d4eb71a6ffc414c4b1304&per_page=10&format=json&nojsoncallback=1&auth_token=&api_sig=
    
    NSDictionary *parameters = @{@"method":@"flickr.photos.search",
                                 @"api_key":flickrApiKey,
                                 @"auth_token":@"72157672126429802-58104f9d959f39ee",
                                 @"api_sig":@"bb50c8a994c1cc410c92607e7d032eab",
                                 @"format":@"json",
                                 @"per_page":@"10",
                                 @"nojsoncallback":@"1"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"https://api.flickr.com/services/rest"
      parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
        
        //            Get data
        
        
            id obj = [responseObject objectForKey:@"query"];
            id pages = [obj objectForKey:@"pages"];

            dispatch_async(dispatch_get_main_queue(), ^{

                
            });
        
        
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

-(void)setUpViews{
    self.mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.storyVC = [[StoryViewController alloc] initWithNibName:@"StoryViewController" bundle:nil];
    self.messageVC = [[MessageViewController alloc] initWithNibName:@"MessageViewController" bundle:nil];
    self.storyVC.delegate = self;
    self.mainVC.delegate = self;
    self.messageVC.delegate = self;
}

-(void)setUpPageViewControllerToOpenToMain{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    NSArray *viewControllers = [NSArray arrayWithObject:self.mainVC];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
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

#pragma StoryViewDelegate
-(void)goToMainFromStoryClicked{
    NSArray *viewControllers = [NSArray arrayWithObject:self.mainVC];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma MainViewControllerDelegate
-(void)goToStoryFromMainClicked{
    NSArray *viewControllers = [NSArray arrayWithObject:self.storyVC];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}

-(void)goToMessageFromMainClicked{
    NSArray *viewControllers = [NSArray arrayWithObject:self.messageVC];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma MessageViewControllerDelegate
-(void)goToMainFromMessage{
    NSArray *viewControllers = [NSArray arrayWithObject:self.mainVC];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}


@end
