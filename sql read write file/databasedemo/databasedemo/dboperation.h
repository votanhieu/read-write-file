//
//  dboperation.h
//  databasedemo
//
//  Created by Yogesh Patel on 13/09/17.
//  Copyright © 2017 Yogesh Patel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <sqlite3.h>
@interface dboperation : NSObject
{
    AppDelegate *appdel;
    sqlite3 *database;
}
@property(strong, nonatomic)NSMutableArray * arrdata;
@property(strong, nonatomic)NSString *strmain;
-(NSMutableArray *)getalluser:(NSString *)query;
@end
