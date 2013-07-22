//
//  ServeUp.m
//  Teacher's Pet
//
//  Created by Christine Franks on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import "ServeUp.h"

@implementation ServeUp

+(NSString*)newUser:(NSString*)nameEx withPace:(NSString*)paceEx withPhone:(NSString*)phoneEx{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/newUser.php?name=%@&currentPace=%@&phoneId=%@", nameEx, paceEx,phoneEx];
    // NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    //[[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
  //  NSLog("%@", [NSString stringWithUTF8String:[data bytes]]);
    NSString* userIdStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"UID: %@", userIdStr);
    return userIdStr;
}


+(NSString*)newClass:(NSString*)user{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/newClass.php?teacherId=%@", user];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* classIdStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"CID: %@", classIdStr);
    return classIdStr;
}

+(BOOL)joinClass:(NSString*)classId fromUser:(NSString*)user{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/joinClass.php?userId=%@&classCode=%@", user, classId];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* successFailAdd = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSInteger successFailAddNum = [successFailAdd integerValue];
    NSLog(@"JOIN P/F: %d", successFailAddNum);
    if(successFailAddNum){
        return YES;
    }
    return NO;
}

+(NSInteger)addClassTask:(NSString*)class withDescription:(NSString*)description {
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/addClassTask.php?classId=%@&description=%@", class, description];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* taskId = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSInteger taskIdNum = [taskId integerValue];
    NSLog(@"ADD: %d", taskIdNum);
    return taskIdNum;
}

+(BOOL)finishTask:(NSString*)user withTaskId:(NSInteger)taskId{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/finishTask.php?studentId=%@&id=%d", user, taskId];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* successFailFinish = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSInteger successFailFinishNum = [successFailFinish integerValue];
    NSLog(@"FINISH P/F: %d", successFailFinishNum);
    if(successFailFinishNum){
        return YES;
    }
    return NO;
}

+(NSInteger)getTaskPercent:(NSString*)user withTaskId:(NSInteger)taskId{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/getTaskPercent.php?studentId=%@&id=%d", user, taskId];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* percent = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSInteger percentNum = [percent integerValue];
    NSLog(@"PCT: %d", percentNum);
    return percentNum;
}

+(NSInteger)getClassPace:(NSString*)classId{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/getPaceAvg.php?classId=%@", classId];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* pace = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSInteger paceNum = [pace integerValue];
    NSLog(@"GET PACE: %d", paceNum);
    return paceNum;
}

+(BOOL)setMyPace:(NSString*)user withPace:(float)pace{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/setPace.php?studentId=%@&pace=%f", user, pace];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* successFailSet = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSInteger successFailSetNum = [successFailSet integerValue];
    NSLog(@"SET PACE P/F: %d", successFailSetNum);
    if(successFailSetNum){
        return YES;
    }
    return NO;
}

+(BOOL)leaveClass:(NSString*)user{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/leaveClass.php?userId=%@", user];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* successFailDrop = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSInteger successFailDropNum = [successFailDrop integerValue];
    NSLog(@"DROP P/F: %d", successFailDropNum);
    if(successFailDropNum){
        return YES;
    }
    return NO;
}

+(NSInteger)sendHelp:(NSString*)user{
    //TODO - returns what number they are in line. Finish on completion of server backend.
    return 0;
}

+(NSArray*)getTaskList:(NSString*)user{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/getAllTasksFromUserId.php?userId=%@", user];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"OBJECT %@", jsonObject);
    
    NSMutableArray* taskList = [[NSMutableArray alloc] init];
    NSMutableArray* descriptions = [[NSMutableArray alloc] init];
    NSMutableArray* completeds = [[NSMutableArray alloc] init];
    
    for(NSDictionary *item in [jsonObject objectForKey:@"data"]){
        //NSLog(@"ITEM %@", item);
        NSString *complete = [item objectForKey:@"isComplete"];
        NSString *type = [item objectForKey:@"type"];
        NSString *sId = [item objectForKey:@"studentId"];
        //note: type = 1 (help), 0 (regular)
        if([complete isEqualToString:@"0"] && [type isEqualToString:@"0"]
        && [sId isEqualToString:[[NSUserDefaults standardUserDefaults] stringForKey:@"uId"]]){
            NSString *identifier = [item objectForKey:@"id"];
            NSLog(@"IDENTIFIER: %@", identifier);
            [descriptions addObject:[item objectForKey:@"description"]];
            [completeds addObject:[item objectForKey:@"isComplete"]];
        }
    }

    [taskList addObject:descriptions];
    [taskList addObject:completeds];
    
    return [[NSArray alloc] init];
}

@end