//
//  ServeUp.h
//  Teacher's Pet
//
//  Created by Christine Franks on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServeUp : NSURLConnection <NSURLConnectionDelegate>
+(NSString*)newUser:(NSString*)nameEx withPace:(NSString*)paceEx withPhone:(NSString*)phoneEx;
+(NSString*)newClass:(NSString*)user;
+(BOOL)joinClass:(NSString*)classId fromUser:(NSString*)user;
+(BOOL)leaveClass:(NSString*)user;
+(NSInteger)addClassTask:(NSString*)classId withDescription:(NSString*)description;
+(BOOL)finishTask:(NSString*)user withTaskId:(NSInteger)taskId;
+(NSInteger)getTaskPercent:(NSString*)user withTaskId:(NSInteger)taskId;
+(NSInteger)getClassPace:(NSString*)classId;
+(BOOL)setMyPace:(NSString*)user withPace:(float)pace;
+(NSInteger)sendHelp:(NSString*)user;
+(NSArray*)getTaskList:(NSString*)user;
@end
