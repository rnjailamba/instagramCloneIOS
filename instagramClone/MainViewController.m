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
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#define flickrApiKey @"00923c662907d65b84f0b3f9c8c353f9"


@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,UITabBarDelegate,UITabBarControllerDelegate>

- (IBAction)mailClicked:(id)sender;
- (IBAction)addClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *tabViewControllers;
@property (nonatomic) UIWindow *window;
@property (nonatomic) NSMutableArray *photos;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self registerNib];
    [self setUpTableView];
    [self getData];
    // Do any additional setup after loading the view from its nib.
}

-(void)getData{
    //
    NSDictionary *parameters = @{@"method":@"flickr.photos.search",
                                 @"api_key":flickrApiKey,
                                 @"auth_token":@"72157673109555376-80ac9ac09a3c3bb0",
                                 @"api_sig":@"be7bc9f25d6da0267dc69c1c4fdc7dd8",
                                 @"format":@"json",
                                 @"per_page":@"10",
                                 @"nojsoncallback":@"1"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"https://api.flickr.com/services/rest"
      parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
          
          //Get data
          
          
          id obj = [responseObject objectForKey:@"photos"];
          id photos = [obj objectForKey:@"photo"];
          self.photos = photos;
          dispatch_async(dispatch_get_main_queue(), ^{
              [self.tableView reloadData];
              
          });
          
          
          
      } failure:^(NSURLSessionTask *operation, NSError *error) {
          NSLog(@"Error: %@", error);
      }];
    
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

#pragma UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSMutableDictionary *dict = [self.photos objectAtIndex:indexPath.row];
        NSString *farm = [dict objectForKey:@"farm"];
        NSString *server = [dict objectForKey:@"server"];
        NSString *secret = [dict objectForKey:@"secret"];
        NSString *theId = [dict objectForKey:@"id"];
        //https://farm9.staticflickr.com/8016/29266365476_3cd91958ec_n.jpg
        NSString *url = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@_n.jpg",farm,server,theId,secret];
        NSLog(@"url is %@",url);
        [cell.photo sd_setImageWithURL:[NSURL URLWithString:url ] placeholderImage:[UIImage imageNamed:@"place.png"]];
        cell.photo.clipsToBounds = YES;
    });

    cell.preservesSuperviewLayoutMargins = false;
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.photos count];    //count number of row from counting array hear cataGorry is An Array
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
