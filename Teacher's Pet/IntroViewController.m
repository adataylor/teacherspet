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


- (IBAction)teacherAlertMessage:(id)sender{
    NSBundle *appBundle = [NSBundle mainBundle];
    
    UIAlertView *teacherMessage = [[UIAlertView alloc] initWithTitle:@"Class ID:"
                                                      message:@"Enter ID."
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    teacherMessage.alertViewStyle = UIAlertViewStylePlainTextInput;
    teacherMessage.tag = 101;
    
   // [alertView:teacherMessage clickedButtonAtIndex:0];
    [teacherMessage show];
}

- (BOOL)idVerification:(UIAlertView *)alertView
{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    if([[[alertView textFieldAtIndex:0] text] isEqualToString:@"A"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}




- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{

    if ([self idVerification:alertView]){
    if (buttonIndex == 0){
        if (alertView.tag == 101)
        {
          TeacherViewController *tv = [[TeacherViewController alloc] init];
        
          [self presentViewController:tv animated:YES completion:nil];
        }
        else
        {
           StudentViewController *sv = [[StudentViewController alloc] init];
          [self presentViewController:sv animated:YES completion:nil];
        }
    }
    }
    else
    {
        
        UIAlertView *wrongPassword = [[UIAlertView alloc] initWithTitle:@"Wrong ID!"
                                                                 message:@":("
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil];
        [wrongPassword show];
        
        //[wrongPassword release];
        
        //[wrongPassword dismissWithClickedButtonAtIndex:nil animated:YES];
        
    }
}


- (IBAction)studentAlertMessage:(id)sender{
    NSBundle *appBundle = [NSBundle mainBundle];
    
    UIAlertView *studentMessage = [[UIAlertView alloc] initWithTitle:@"Class ID:"
                                                             message:@"Enter ID."
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
    studentMessage.alertViewStyle = UIAlertViewStylePlainTextInput;
    studentMessage.tag = 102;
    
    // [alertView:teacherMessage clickedButtonAtIndex:0];
    [studentMessage show];
}





@end