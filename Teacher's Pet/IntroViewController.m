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
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"firstTimeLoaded"]){
        TeacherViewController *teacherVC = [[TeacherViewController alloc] init];
        [self presentViewController:teacherVC animated:YES completion:nil];
    }
    else if([[NSUserDefaults standardUserDefaults] stringForKey:@"uId"] != nil){
        [self teacherCreateClassPrompt:sender];
    }
    else{
        UIAlertView *signUp = [[UIAlertView alloc] initWithTitle:@"Choose Username"
                                                                 message:@"Enter your name:"
                                                                delegate:self
                                                       cancelButtonTitle:@"Sign Up"
                                                       otherButtonTitles:nil];
        signUp.alertViewStyle = UIAlertViewStylePlainTextInput;
        [signUp addButtonWithTitle:@"Cancel"];
        signUp.tag = 104;
        [signUp show];
    }
}

- (void)teacherCreateClassPrompt:(id)sender{
    UIAlertView *teacherMessage = [[UIAlertView alloc] initWithTitle:@"Create Class?"
                                                             message:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"Create"
                                                   otherButtonTitles:nil];
    [teacherMessage addButtonWithTitle:@"Cancel"];

    teacherMessage.alertViewStyle = UIAlertViewStyleDefault;
    teacherMessage.tag = 101;
    
    [teacherMessage show];
}







//check to see if the selected ClassID exists; for students only
- (BOOL)idVerification:(UIAlertView *)alertView
{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    if(inputText == nil)
        return NO;
    if([ServeUp joinClass:inputText fromUser:[[NSUserDefaults standardUserDefaults] stringForKey:@"uId"]]){
        NSDictionary* cIdDefaults = [NSDictionary dictionaryWithObject:inputText forKey:@"cId"];
        [[NSUserDefaults standardUserDefaults] registerDefaults:cIdDefaults];
        return YES;
    }
    else
        return NO;
}

-(BOOL)nameVerification:(UIAlertView*)alertView{
    NSString *input = [[alertView textFieldAtIndex:0] text];
    //TODO verify name okay -- need a function to return if in table. (right now just one case (nil) tested for)
    if(input == nil || [input isEqual: @""])
       return NO;
    return YES;
}


//checks against remote db to ensure class does not already exist (called when creating)
-(BOOL)classNotExtantVerification:(UIAlertView*)alertView{
    NSString* success = [ServeUp newClass:[[NSUserDefaults standardUserDefaults] stringForKey:@"uId"]];
    if(![success isEqualToString:@""]){
        NSDictionary* dflts = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:[success integerValue]] forKey:@"cId"];
        [[NSUserDefaults standardUserDefaults] registerDefaults:dflts];
            return YES;
    }
    return NO;
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{

    if(buttonIndex == 1){
        [self cancelled:nil];
        return;
    }
    
    //Teacher class add handler
    if (alertView.tag == 101)
    {
        if([self classNotExtantVerification:alertView]){
            NSDictionary* endFirstLoaded = [NSDictionary dictionaryWithObject:@YES forKey:@"firstTimeLoaded"];
            [[NSUserDefaults standardUserDefaults] registerDefaults:endFirstLoaded];
            TeacherViewController *teacherVC = [[TeacherViewController alloc] init];
            [self presentViewController:teacherVC animated:YES completion:nil];
        }
        else{
            [self invalidity:nil];
            return;
            //[self teacherAlertMessage:nil];
        }
    }
    
    //teacher name handler
    else if (alertView.tag == 104){
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
            [self teacherCreateClassPrompt:alertView];
        }
        else{
            [self invalidity:nil];
            return;
            //[self teacherAlertMessage:nil];
        }
    }
    
    //student class add handler
    else if (alertView.tag == 102)
    {
        if ([self idVerification:alertView]){
            NSDictionary* endFirstLoaded = [NSDictionary dictionaryWithObject:@YES forKey:@"firstTimeLoaded"];
            [[NSUserDefaults standardUserDefaults] registerDefaults:endFirstLoaded];
            StudentViewController *studentVC = [[StudentViewController alloc] init];
            [self presentViewController:studentVC animated:YES completion:nil];
        }
        else{
            [self invalidity:nil];
            return;
            //[self studentJoinClassPrompt:nil];
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
                [self studentJoinClassPrompt:alertView];
        }
        else{
            [self invalidity:nil]; //TODO time-separator problems? can't test until joinClass server backend finished
            return;
            //[self studentUsernamePrompt:nil];
        }
    }
    
}


- (IBAction)studentUsernamePrompt:(id)sender{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"firstTimeLoaded"]){
        StudentViewController *studentVC = [[StudentViewController alloc] init];
        [self presentViewController:studentVC animated:YES completion:nil];
    }
    else if([[NSUserDefaults standardUserDefaults] stringForKey:@"uId"] != nil){
        [self studentJoinClassPrompt:sender];
    }
    else{
        UIAlertView *studentMessage = [[UIAlertView alloc] initWithTitle:@"Choose Username"
                                                             message:@"Enter your name:"
                                                            delegate:self
                                                   cancelButtonTitle:@"Sign Up"
                                                   otherButtonTitles:nil];
        studentMessage.alertViewStyle = UIAlertViewStylePlainTextInput;
        [studentMessage addButtonWithTitle:@"Cancel"];
        studentMessage.tag = 103;
        [studentMessage show];
    }
}

- (void)studentJoinClassPrompt:(id)sender{
    UIAlertView *studentMessage = [[UIAlertView alloc] initWithTitle:@"Join a Class"
                                                             message:@"Enter the class ID:"
                                                            delegate:self
                                                   cancelButtonTitle:@"Join Class"
                                                   otherButtonTitles:nil];
    studentMessage.alertViewStyle = UIAlertViewStylePlainTextInput;
    studentMessage.tag = 102;
    [studentMessage addButtonWithTitle:@"Cancel"];
    [studentMessage show];
}

-(void)invalidity:(id)sender{
    UIAlertView *wrongPassword = [[UIAlertView alloc] initWithTitle:@"Invalid ID"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
    [wrongPassword show];
}

-(void)cancelled:(id)sender{
    UIAlertView *cancelled = [[UIAlertView alloc] initWithTitle:@"Cancelled"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
    [cancelled show];
}

@end