//
//  StudentViewController.m
//  Teacher's Pet
//
//  Created by Ada Taylor on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import "StudentViewController.h"
#import "Tasks.h"
@interface StudentViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UISlider *difficultyBar;

@end

@implementation StudentViewController
- (IBAction)exitView:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationItem *n = [self navigationItem];
        
        [n setTitle:@"Student"];
        
    }
    return self;
}
- (IBAction)difficultyChanged:(id)sender {
    
}
- (float)difficulty{
    return _difficultyBar.value;
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

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create an instance of UITableViewCell, with default appearance
    // Check for a reusable cell first, use that if it exists
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    // If there is no reusable cell of this type, create a new one
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"UITableViewCell"];
    }
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    Tasks *p = [[[Tasks tasksSingleton] allTasks]
                  objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[p description]];
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   // [[[Tasks tasksSingleton] allTasks] reloadData];
    NSLog(@"I wish i could add a Task");
    //[[[Tasks tasksSingleton] allTasks] reloadData];
}


//- (void)loadView
//
//{
//
//    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
//    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    [tableView reloadData];    
//    self.view = tableView;
//    
//}
@end
