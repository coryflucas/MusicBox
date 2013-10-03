//
//  AppDelegate.h
//  MusicBox
//
//  Created by Cory Lucas on 9/30/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "MusicServiceProvider.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    @private
    id<MusicServiceProvider> _provider;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet WebView *webView;
@property (assign) IBOutlet NSMenu *dockMenu;

-(IBAction)playPause:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)previous:(id)sender;

@end
