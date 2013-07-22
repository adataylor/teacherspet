//
//  TeacherViewController.m
//  Teacher's Pet
//
//  Created by Ada Taylor on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import "TeacherViewController.h"

@interface TeacherViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;

@end

@implementation TeacherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UINavigationItem *n = [self navigationItem];
        
        [n setTitle:@"Teacher"];
    }
    return self;
}

//no need to drop the class num (will not allow access back in until new one created)
- (IBAction)exitView:(id)sender {
    [self verifyAction];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTask:(id)sender {
    //For teacher to add a new task
}

-(void)verifyAction{
    UIAlertView *checkExit = [[UIAlertView alloc] initWithTitle:@"Leave Class"
                                                        message:@"If you leave, you cannot return to this class."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [checkExit setTag:101];
    [checkExit addButtonWithTitle:@"Cancel"];
    [checkExit show];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if([alertView tag] == 101){
        if(buttonIndex == 1)
            return;
        else{
            NSDictionary* endFirstLoaded = [NSDictionary dictionaryWithObject:@NO forKey:@"firstTimeLoaded"];
            [[NSUserDefaults standardUserDefaults] registerDefaults:endFirstLoaded];
            [self dismissViewControllerAnimated:NO completion:nil];
        }
    }
}

@end
