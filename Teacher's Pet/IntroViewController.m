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
#import "ServeUp.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)teacherAlertMessage:(id)sender{
    //NSBundle *appBundle = [NSBundle mainBundle];
    
    UIAlertView *teacherMessage = [[UIAlertView alloc] initWithTitle:@"Class ID"
                                                      message:@"Enter the class ID:"
                                                     delegate:self
                                            cancelButtonTitle:@"Create Class"
                                            otherButtonTitles:nil];
    teacherMessage.alertViewStyle = UIAlertViewStylePlainTextInput;
    teacherMessage.tag = 101;
    
   // [alertView:teacherMessage clickedButtonAtIndex:0];
    [teacherMessage show];
}






//check to see if the selected ClassID exists; for students only
- (BOOL)idVerification:(UIAlertView *)alertView
{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    if([ServeUp joinClass:[inputText integerValue] fromUser:[[NSUserDefaults standardUserDefaults] stringForKey:@"uId"]]){
        NSDictionary* cIdDefaults = [NSDictionary dictionaryWithObject:inputText forKey:@"cId"];
        [[NSUserDefaults standardUserDefaults] registerDefaults:cIdDefaults];
        return YES;
    }
    else
        return NO;
    //BOOL verified = NO;
    //while(verified == NO){
    //    verified = [ServeUp joinClass:[inputText integerValue] fromUser:[[NSUserDefaults standardUserDefaults] stringForKey:@"uId"]];
    //}
}

-(BOOL)nameVerification:(UIAlertView*)alertView{
    //TODO verify name okay -- need a function to return if in table.
    return YES;
}




- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{

    //Teacher class add handler
    if (alertView.tag == 101)
    {
        NSDictionary* dflts = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:[ServeUp newClass]] forKey:@"cId"];
        [[NSUserDefaults standardUserDefaults] registerDefaults:dflts];
        TeacherViewController *teacherVC = [[TeacherViewController alloc] init];
        [self presentViewController:teacherVC animated:YES completion:nil];
    }
    
    //student class add handler
    else if (alertView.tag == 102)
    {
        if ([self idVerification:alertView]){
            StudentViewController *studentVC = [[StudentViewController alloc] init];
            [self presentViewController:studentVC animated:YES completion:nil];
        }
        else{
            [self invalidity:nil];// TODO time-separator problems? can't test until joinClass server backend finished
            [self studentJoinClassPrompt:nil];
        }
    }
    
    //student name handler
    else if (alertView.tag == 103){
        if([self nameVerification:alertView]){
            NSString* name =[[alertView textFieldAtIndex:0] text];
            UIDevice* device = [[UIDevice alloc] init];
            NSString* phone = [[device identifierForVendor] UUIDString];
            NSString* pace =@"0.5";
            NSDictionary* paceDefault = [NSDictionary dictionaryWithObject:@0.5 forKey:@"pace"];
            [[NSUserDefaults standardUserDefaults] registerDefaults:paceDefault];
            NSString* newUserIdString = [ServeUp newUser:name withPace:pace withPhone:phone];
            NSDictionary* uIdDefault = [NSDictionary dictionaryWithObjects:@[newUserIdString, name] forKeys:@[@"uId", @"uName"]];
            [[NSUserDefaults standardUserDefaults] registerDefaults:uIdDefault];
            NSDictionary* endFirstLoaded = [NSDictionary dictionaryWithObject:@YES forKey:@"firstTimeLoaded"];
            [[NSUserDefaults standardUserDefaults] registerDefaults:endFirstLoaded];
            [self studentJoinClassPrompt:alertView];
        }
        else{
            [self invalidity:nil]; //TODO time-separator problems? can't test until joinClass server backend finished
            [self studentUsernamePrompt:nil];
        }
    }
}


- (IBAction)studentUsernamePrompt:(id)sender{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"firstTimeLoaded"]){
        StudentViewController *studentVC = [[StudentViewController alloc] init];
        [self presentViewController:studentVC animated:YES completion:nil];
    }
    else{
        UIAlertView *studentMessage = [[UIAlertView alloc] initWithTitle:@"Username"
                                                             message:@"Enter your name:"
                                                            delegate:self
                                                   cancelButtonTitle:@"Sign Up"
                                                   otherButtonTitles:nil];
        studentMessage.alertViewStyle = UIAlertViewStylePlainTextInput;
        studentMessage.tag = 103;
        [studentMessage show];
    }
}

- (void)studentJoinClassPrompt:(id)sender{
    //NSBundle *appBundle = [NSBundle mainBundle];
    UIAlertView *studentMessage = [[UIAlertView alloc] initWithTitle:@"Class ID"
                                                             message:@"Enter your class ID:"
                                                            delegate:self
                                                   cancelButtonTitle:@"Join Class"
                                                   otherButtonTitles:nil];
    studentMessage.alertViewStyle = UIAlertViewStylePlainTextInput;
    studentMessage.tag = 102;
    [studentMessage show];
}

-(void)invalidity:(id)sender{
    UIAlertView *wrongPassword = [[UIAlertView alloc] initWithTitle:@"Invalid ID"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
    [wrongPassword show];
        //[wrongPassword dismissWithClickedButtonAtIndex:nil animated:YES];
}

@end