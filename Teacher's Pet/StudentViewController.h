//
//  StudentViewController.h
//  Teacher's Pet
//
//  Created by Ada Taylor on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentViewController : UIViewController
- (IBAction)needsHelp:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tasksList;
- (IBAction)exitView:(id)sender;
- (float)difficulty; 
@end
