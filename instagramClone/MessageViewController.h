//
//  MessageViewController.h
//  instagramClone
//
//  Created by alisha bhatia on 24/08/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MessageViewControllerDelegate <NSObject>

@required
-(void)goToMainFromMessage;

@end

@interface MessageViewController : UIViewController

@property id<MessageViewControllerDelegate> delegate;

@end
