//
//  IntroViewController.m
//  Teacher's Pet
//
//  Created by Ada Taylor on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import "IntroViewController.h"
#import "TeacherViewController.h"
#import "StudentViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (IBAction)teacherClick:(id)sender {
    NSBundle *appBundle = [NSBundle mainBundle];
    TeacherViewController *tv = [[TeacherViewController alloc] init];
    
    [self presentViewController:tv animated:YES completion:nil];
    
    //[[self window] setRootViewController:tv];
}

- (IBAction)studentClick:(id)sender {
    NSBundle *appBundle = [NSBundle mainBundle];
    StudentViewController *sv = [[StudentViewController alloc] init];
    
    [self presentViewController:sv animated:YES completion:nil];
    //[[self window] setRootViewController:sv];
}

@end