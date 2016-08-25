//
//  MainViewController.h
//  instagramClone
//
//  Created by alisha bhatia on 24/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainViewControllerDelegate <NSObject>

@required
-(void) goToMessageFromMainClicked;
-(void) goToStoryFromMainClicked;

@end

@interface MainViewController : UIViewController

@property id<MainViewControllerDelegate> delegate;

@end
