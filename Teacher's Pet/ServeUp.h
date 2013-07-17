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
+(NSInteger)newClass;
+(BOOL)joinClass:(NSInteger)class fromUser:(NSString*)user;
+(BOOL)leaveClass:(NSString*)user;
+(NSInteger)addClassTask:(NSInteger)class withDescription:(NSString*)description;
+(BOOL)finishTask:(NSString*)user withTaskId:(NSInteger)taskId;
+(NSInteger)getTaskPercent:(NSString*)user withTaskId:(NSInteger)taskId;
+(NSInteger)getPaceAvg:(NSInteger)taskId;
+(BOOL)setMyPace:(NSString*)user forTask:(NSInteger)taskId;
@end
