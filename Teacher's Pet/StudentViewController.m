//
//  StudentViewController.m
//  Teacher's Pet
//
//  Created by Ada Taylor on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import "StudentViewController.h"
#import "Tasks.h"
#import "ServeUp.h"
#import "HelpMessageViewController.h"

@interface StudentViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UISlider *difficultyBar;

@end

@implementation StudentViewController

//Hit back button (called "exit")
- (IBAction)exitView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationItem *navBar = [self navigationItem];
        //NSString* title = [NSString stringWithFormat:@"Welcome, %@!", [[NSUserDefaults standardUserDefaults] stringForKey:@"uName"]];
        //[navBar setTitle:title];
    }
    return self;
}

//on move of paceBar slider, store this as the new pace, and send to server to update tables.
- (IBAction)difficultyChanged:(id)sender {
    NSLog(@"%f", [[self difficultyBar] value]);
    NSDictionary* paceDefault = [NSDictionary dictionaryWithObject:@([[self difficultyBar] value]) forKey:@"pace"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:paceDefault];
    [ServeUp setMyPace:[[NSUserDefaults standardUserDefaults] stringForKey:@"uName"] withPace:[[self difficultyBar] value]];
}

//gets the value of the paceBar
- (float)difficulty{
    return _difficultyBar.value;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //sets the value of the paceBar to the stored val to start
    [[self difficultyBar] setValue:[[[NSUserDefaults standardUserDefaults] stringForKey:@"pace"] floatValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }

    Tasks *p = [[[Tasks tasksSingleton] allTasks] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[p description]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[Tasks tasksSingleton] allTasks] count];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tasksList] reloadData];
}

- (IBAction)needsHelp:(id)sender {
    HelpMessageViewController *helpVC = [[HelpMessageViewController alloc] init];
    [self presentViewController:helpVC animated:YES completion:nil];
}
@end
