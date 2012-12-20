//
//  ZJTAppDelegate.m
//  FindGirls
//
//  Created by Patrick.Z on 12/19/12.
//  Copyright (c) 2012 ZJT. All rights reserved.
//

#import "ZJTAppDelegate.h"

#import "ZJTViewController.h"
#import "ZJTHomeViewController_iPhone.h"
#import "ZJTLeftViewController_iPhone.h"
#import "ZJTRightViewController_iPhone.h"

#import "DDMenuController.h"

@implementation ZJTAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    ZJTHomeViewController_iPhone *homeController = [[ZJTHomeViewController_iPhone alloc] initWithNibName:@"ZJTHomeViewController_iPhone" bundle:nil];
    
    UINavigationController *mainController = [[UINavigationController alloc] initWithRootViewController:homeController];
    [mainController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_light_background.png"] forBarMetrics:UIBarMetricsDefault];
    
    DDMenuController *rootController = [[[DDMenuController alloc] initWithRootViewController:mainController] autorelease];
    
    ZJTLeftViewController_iPhone *leftController = [[ZJTLeftViewController_iPhone alloc] initWithNibName:@"ZJTLeftViewController_iPhone" bundle:nil];
    ZJTRightViewController_iPhone *rightController = [[ZJTRightViewController_iPhone alloc] initWithNibName:@"ZJTRightViewController_iPhone" bundle:nil];
    
    rootController.leftViewController = leftController;
    rootController.rightViewController = rightController;
    
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
    
    [leftController release];
    [rightController release];
    [homeController release];
    [mainController release];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
