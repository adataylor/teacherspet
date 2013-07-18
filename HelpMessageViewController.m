//
//  HelpMessageViewController.m
//  Teacher's Pet
//
//  Created by Christine Franks on 7/17/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import "HelpMessageViewController.h"
#import "ServeUp.h"

@interface HelpMessageViewController ()
@property (weak, nonatomic) IBOutlet UILabel *helpMessage;
@end

@implementation HelpMessageViewController

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

- (IBAction)backToPortal:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    NSInteger helpNum = [ServeUp sendHelp:[[NSUserDefaults standardUserDefaults] stringForKey:@"uName"]];
    [[self helpMessage] setText:[NSString stringWithFormat:@"Your help request was submitted!\nYou are number %d on the list.", helpNum]];
    [[self helpMessage] setNumberOfLines:0];
}

@end
