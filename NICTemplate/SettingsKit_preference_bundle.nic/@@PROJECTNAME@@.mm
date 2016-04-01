//
//  @@PROJECTNAME@@ListController.m
//  @@FULLPROJECTNAME@@
//
//  Created by @@USER@@ on @@DATE@@.
//  Copyright (c) @@YEAR@@ @@USER@@. All rights reserved.
//

#import <Preferences/Preferences.h>
#import <SettingsKit/SKListControllerProtocol.h>
#import <SettingsKit/SKTintedListController.h>

@interface @@PROJECTNAME@@ListController: SKTintedListController<SKListControllerProtocol>
@end

@implementation @@PROJECTNAME@@ListController

/*
 Want a tint color?
 -(UIColor*) tintColor { return [UIColor orangeColor]; }
 -(BOOL) tintNavigationTitleText { return NO; }
 */


-(NSString*) headerText { return @"@@PROJECTNAME@@"; }

-(NSString*) customTitle { return @"@@PROJECTNAME@@"; }
-(NSArray*) customSpecifiers
{
    return @[
            @{
                @"cell": @"PSGroupCell",
                @"label": @"@@PROJECTNAME@@ Settings"
            },
            @{
                @"defaults": @"@@PACKAGENAME@@",
                @"PostNotification": @"@@PACKAGENAME@@/reloadSettings",
                @"cell": @"PSSwitchCell",
                @"cellClass": @"SKTintedSwitchCell"
                @"key": @"enabled",
                @"default": @YES,
                @"label": @"Enabled",
            }
    ];
}
@end
