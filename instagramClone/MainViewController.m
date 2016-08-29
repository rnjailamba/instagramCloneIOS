//
//  MainViewController.m
//  instagramClone
//
//  Created by alisha bhatia on 24/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "MainViewController.h"
#import "FeedCell.h"
#import "SearchViewController.h"


@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,UITabBarDelegate,UITabBarControllerDelegate>

- (IBAction)mailClicked:(id)sender;
- (IBAction)addClicked:(id)sender;
@property (nonatomic) UITabBarController *tabBarController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (nonatomic) NSMutableArray *tabViewControllers;
@property (nonatomic) UIWindow *window;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.tabBar.delegate = self;
    [self registerNib];
    [self setUpTableView];
    [self setUpTabBarController];
    // Do any additional setup after loading the view from its nib.
}

-(void)setUpTabBarController{

//
//    MainViewController *mainVC = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
//    SearchViewController *searchVC = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
//    self.tabViewControllers = [[NSMutableArray alloc] init];
//    [self.tabViewControllers addObject:mainVC];
//    [self.tabViewControllers addObject:searchVC];
//    [self.tabViewControllers addObject:searchVC];
//    [self.tabViewControllers addObject:searchVC];
//    [self.tabViewControllers addObject:searchVC];
//
//    self.tabBarController = [[UITabBarController alloc]init];
//    self.tabBarController.viewControllers = self.tabViewControllers;
    
    
    
    
    MainViewController *viewController1 = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil] ;
    SearchViewController *viewController2 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    SearchViewController *viewController3 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    SearchViewController *viewController4 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    SearchViewController *viewController5 = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    
    UINavigationController *navigationController1=[[UINavigationController alloc]initWithRootViewController:viewController1];
    [navigationController1.navigationBar setBackgroundImage:[UIImage imageNamed:@"love.png"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *navigationController2=[[UINavigationController alloc]initWithRootViewController:viewController2];
    [navigationController2.navigationBar setBackgroundImage:[UIImage imageNamed:@"person.png"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *navigationController3=[[UINavigationController alloc]initWithRootViewController:viewController3];
    [navigationController3.navigationBar setBackgroundImage:[UIImage imageNamed:@"upwhitebg.png"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *navigationController4=[[UINavigationController alloc]initWithRootViewController:viewController4];
    [navigationController4.navigationBar setBackgroundImage:[UIImage imageNamed:@"upwhitebg.png"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationController *navigationController5=[[UINavigationController alloc]initWithRootViewController:viewController5];
    [navigationController5.navigationBar setBackgroundImage:[UIImage imageNamed:@"upwhitebg.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    [navigationController1.navigationBar setHidden:YES];
    [navigationController2.navigationBar setHidden:YES];
    [navigationController3.navigationBar setHidden:YES];
    [navigationController4.navigationBar setHidden:YES];
    [navigationController5.navigationBar setHidden:YES];
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    [self.tabBarController.tabBar setBackgroundColor:[UIColor clearColor]];
    
    self.tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar"];
    [[[self tabBarController]tabBar]setSelectionIndicatorImage:[UIImage imageNamed:@"transparent.png"]];
    [self.tabBarController setDelegate:self];
    self.tabBarController.viewControllers = @[navigationController1, navigationController2,navigationController3,navigationController4,navigationController5];
    self.window.rootViewController = self.tabBarController;

}

-(void)setUpTableView{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(void)registerNib{
    [self.tableView registerNib:[UINib nibWithNibName:@"FeedCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    //   int index = [tabBar.items indexOfObject:item];
    NSLog(@"Tab bar %ld",(long)item.tag);
    switch (item.tag) {
        case 1:{
            MainViewController *mainVC = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
            [self.presentedViewController.view removeFromSuperview];
            [self.view addSubview:mainVC.view];

            break;
        }
            
        case 2:{
            SearchViewController *searchVC = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
            searchVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49);
            [self.presentedViewController.view removeFromSuperview];
            [self.view addSubview:searchVC.view];

            break;
        }
        default:
            break;
    }

    
}

#pragma UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.preservesSuperviewLayoutMargins = false;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;    //count number of row from counting array hear cataGorry is An Array
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return self.view.frame.size.width + 120.5;
    
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
