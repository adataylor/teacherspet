//
//  Tasks.m
//  Teacher's Pet
//
//  Created by Angela Zhang on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import "Tasks.h"

@implementation Tasks

+ (Tasks *)tasksSingleton
{
    static Tasks *taskStore = nil;
    if(!taskStore)
        taskStore = [[super allocWithZone:nil] init];
    
    return taskStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self tasksSingleton];
}
- (id)init
{
    self = [super init];
    if(self) {
        allTasks = [[NSMutableArray alloc] init];
    }
    return self;
}
- (NSArray *)allTasks
{
    return allTasks;
}
@end
