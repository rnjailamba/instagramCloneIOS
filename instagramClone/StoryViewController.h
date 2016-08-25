//
//  StoryViewController.h
//  instagramClone
//
//  Created by alisha bhatia on 24/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StoryViewDelegate <NSObject>

@required
-(void)goToMainFromStoryClicked;

@end

@interface StoryViewController : UIViewController

@property id<StoryViewDelegate> delegate;

@end
