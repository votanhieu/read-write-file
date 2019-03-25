//
//  AppDelegate.m
//  databasedemo
//
//  Created by Yogesh Patel on 13/09/17.
//  Copyright © 2017 Yogesh Patel. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize strpath;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self copyandpaste];
    return YES;
}

-(void)copyandpaste
{
    NSArray *arr1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);// Search in Array
    NSString *str1 = [arr1 objectAtIndex:0];// O index Value me store 
    strpath = [str1 stringByAppendingPathComponent:@"studatabase.sqlite"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:strpath]) {
        NSString *local = [[NSBundle mainBundle]pathForResource:@"studdatabase" ofType:@"sqlite"];
        [[NSFileManager defaultManager]copyItemAtPath:local toPath:strpath error:nil];
    }
    NSLog(@"%@", strpath);
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
