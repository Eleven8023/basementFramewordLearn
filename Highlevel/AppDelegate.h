//
//  AppDelegate.h
//  Highlevel
//
//  Created by Eleven on 2018/10/31.
//  Copyright © 2018 Eleven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

