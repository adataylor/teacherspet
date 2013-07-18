//
//  IntroViewController.h
//  Teacher's Pet
//
//  Created by Ada Taylor on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroViewController : UIViewController <UIAlertViewDelegate>

- (IBAction)teacherAlertMessage:(id)sender;
- (IBAction)studentUsernamePrompt:(id)sender;

@end
