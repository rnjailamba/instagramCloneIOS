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
#import "ViewController.h"


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
    // Do any additional setup after loading the view from its nib.
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
            ViewController *mainVC = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
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
