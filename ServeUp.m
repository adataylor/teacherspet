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


+(NSInteger)newClass{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/newClass.php"];
    //NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    NSURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* classIdStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSInteger classId = [classIdStr integerValue];
    NSLog(@"CID: %@", classIdStr);
    return classId;
}

+(BOOL)joinClass:(NSInteger)class fromUser:(NSString*)user{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/joinClass.php?userId=%@classId=%d", user, class];
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

+(NSInteger)addClassTask:(NSInteger)class withDescription:(NSString*)description {
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/addClassTask.php?classId=%d&description=%@", class, description];
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

+(NSInteger)getPaceAvg:(NSInteger)taskId{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/getPaceAvg.php?taskId=%d", taskId];
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

+(BOOL)setMyPace:(NSString*)user forTask:(NSInteger)taskId{
    NSString *url = [NSString stringWithFormat:@"https://adat.scripts.mit.edu:444/www/dev/facebook/teacherspet/setMyPace.php?studentId=%@&id=%d", user, taskId];
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

@end