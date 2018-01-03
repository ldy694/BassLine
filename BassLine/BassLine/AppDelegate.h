//
//  AppDelegate.h
//  BassLine
//
//  Created by 林兴栋 on 2017/12/25.
//  Copyright © 2017年 林兴栋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

