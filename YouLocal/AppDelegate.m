//
//  AppDelegate.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import "AppDelegate.h"
#import "NotificationsTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    NotificationsTableViewController *viewController = [[NotificationsTableViewController alloc] init];

    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];

    CALayer * bgGradientLayer = [self gradientBGLayerForBounds:navigation.navigationBar.bounds];
    UIGraphicsBeginImageContext(bgGradientLayer.bounds.size);
    [bgGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * bgAsImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (bgAsImage != nil) {
        [[UINavigationBar appearance] setBackgroundImage:bgAsImage
                                           forBarMetrics:UIBarMetricsDefault];
    }
    

    
    [navigation.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont fontWithName:@"Lato-Regular" size:23],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
    self.window.rootViewController = navigation;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (CALayer *)gradientBGLayerForBounds:(CGRect)bounds
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height + 20);
    gradientLayer.colors = @[ (__bridge id)[UIColor colorWithRed:16/255.0f green:107/255.0f blue:200/255.0f alpha:1].CGColor,
                              (__bridge id)[UIColor colorWithRed:46/255.0f green:201/255.0f blue:111/255.0f alpha:1].CGColor ];
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    return gradientLayer;
}

@end
