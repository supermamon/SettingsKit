#import "SKStandardController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "common.h"

@implementation SKStandardController
-(BOOL) showHeartImage { return YES; }
-(BOOL) tintNavigationTitleText { return NO; }
-(BOOL) shiftHeartImage { return YES; }
-(NSString*) enabledDescription { return @"test"; }
-(BOOL) hasCellIcons { return YES; }

-(NSString *) enableLabelText   {return @"ENABLE";}
-(NSString *) optionsLabelText  {return @"OPTIONS";}
-(NSString *) makersLabelText   {return @"MAKERS";}
-(NSString *) supportLabelText  {return @"SUPPORT";}


-(NSArray*) customSpecifiers
{
    /* 
    need a simpler way for hasCellIcons
    like @"icon": (hasCellIcons ? @"enabled.png" : nill)
    I don't know much about Obj-C yet.
    and I don't want to complicate it with an NSMuteableDictionary array
    */
    if (self.hasCellIcons) {
        return @[
                 @{ @"cell": @"PSGroupCell",
                    @"footerText": self.enabledDescription
                    },
                 @{
                     @"cell": @"PSSwitchCell",
                     @"default": @YES,
                     @"defaults": self.defaultsFileName,
                     @"key": @"enabled",
                     @"label": self.enableLabelText,
                     @"PostNotification": self.postNotification,
                     @"cellClass": @"SKTintedSwitchCell",
                     @"icon": @"enabled.png",
                     },
                 @{ @"cell": @"PSGroupCell" },
                 @{
                     @"cell": @"PSLinkCell",
                     //@"action": @"loadSettingsListController",
                     @"detail": self.settingsListControllerClassName,
                     @"label": self.optionsLabelText,
                     @"icon": @"settings.png",
                     @"cellClass": @"SKTintedCell",
                     },
                 @{ @"cell": @"PSGroupCell" },
                 @{
                     @"cell": @"PSLinkCell",
                     //@"action": @"loadMakersListController",
                     @"detail": self.makersListControllerClassName,
                     @"label": self.makersLabelText,
                     @"icon": @"makers.png",
                     @"cellClass": @"SKTintedCell",
                     },
                 @{ @"cell": @"PSGroupCell",
                    @"footerText": self.footerText, },
                 @{
                     @"cell": @"PSLinkCell",
                     @"action": @"showSupportDialog",
                     @"label": self.supportLabelText,
                     @"icon": @"support.png",
                     @"cellClass": @"SKTintedCell",
                     },
                 ];        
    } else {
        return @[
                 @{ @"cell": @"PSGroupCell",
                    @"footerText": self.enabledDescription
                    },
                 @{
                     @"cell": @"PSSwitchCell",
                     @"default": @YES,
                     @"defaults": self.defaultsFileName,
                     @"key": @"enabled",
                     @"label": self.enableLabelText,
                     @"PostNotification": self.postNotification,
                     @"cellClass": @"SKTintedSwitchCell",
                     },
                 @{ @"cell": @"PSGroupCell" },
                 @{
                     @"cell": @"PSLinkCell",
                     //@"action": @"loadSettingsListController",
                     @"detail": self.settingsListControllerClassName,
                     @"label": self.optionsLabelText,
                     @"cellClass": @"SKTintedCell",
                     },
                 @{ @"cell": @"PSGroupCell" },
                 @{
                     @"cell": @"PSLinkCell",
                     //@"action": @"loadMakersListController",
                     @"detail": self.makersListControllerClassName,
                     @"label": self.makersLabelText,
                     @"cellClass": @"SKTintedCell",
                     },
                 @{ @"cell": @"PSGroupCell",
                    @"footerText": self.footerText, },
                 @{
                     @"cell": @"PSLinkCell",
                     @"action": @"showSupportDialog",
                     @"label": self.supportLabelText,
                     @"cellClass": @"SKTintedCell",
                     },
                 ];          
    }

}


-(NSString*)postNotification { return @""; }
-(NSString*)defaultsFileName { return @""; }

-(NSArray*) emailAddresses { return @[]; }
-(NSString*) emailBody { return @""; }
-(NSString*) emailSubject { return @""; }

//-(void) loadSettingsListController { }
//-(void) loadMakersListController { }

-(NSString*) footerText { return @""; }
             
-(NSString*) settingsListControllerClassName { return @""; }
-(NSString*) makersListControllerClassName { return @""; }

-(void) showSupportDialog
{
    MFMailComposeViewController *mailViewController;
    if ([MFMailComposeViewController canSendMail])
    {
        mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:SK_LCL(self.emailSubject)];
        [mailViewController setMessageBody:SK_LCL(self.emailBody) isHTML:NO];
        [mailViewController setToRecipients:self.emailAddresses];
            
        [self.rootController presentViewController:mailViewController animated:YES completion:nil];
    }

}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(UIColor*) iconColor
{
    if ([self respondsToSelector:@selector(navigationTintColor)])
        return self.navigationTintColor;
    if ([self respondsToSelector:@selector(tintColor)])
        return self.tintColor;
    else
        return [UIColor whiteColor];
}
@end