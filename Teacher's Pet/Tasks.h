//
//  Tasks.h
//  Teacher's Pet
//
//  Created by Angela Zhang on 7/11/13.
//  Copyright (c) 2013 Ada Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tasks : UITableView
{
    NSMutableArray *allTasks;
}
+ (Tasks *) tasksSingleton;
- (NSArray*)allTasks;
@end
