//
//  AppDelegate.m
//  MusicBox
//
//  Created by Cory Lucas on 9/30/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseMusicServiceProvider.h"
#import "MediaKeys/AppleMediaKeyController.h"
#import "GoogleMusic/GoogleMusicProvider.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //TODO: To support multiple providers this will need to be dynamic
    _provider = [[GoogleMusicProvider alloc] initWithWebView: self.webView];
    
    [AppleMediaKeyController sharedController];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(playPause) name:MediaKeyPlayPauseNotification object:nil];
    [center addObserver:self selector:@selector(next) name:MediaKeyNextNotification object:nil];
    [center addObserver:self selector:@selector(previous) name:MediaKeyPreviousNotification object:nil];
}

-(IBAction)playPause:(id)sender {
    [_provider playPause];
}

-(IBAction)next:(id)sender {
    [_provider next];
}

-(IBAction)previous:(id)sender {
    [_provider previous];
}

-(NSMenu*)applicationDockMenu:(NSApplication *)sender {
    NSString* title = @"Nothing Playing...";
    if([[_provider currentArtist] length] > 0) {
        title = [NSString stringWithFormat:@"%@ - %@", [_provider currentArtist], [_provider currentTitle]];
    }
    NSMenuItem* menuItem = [[NSMenuItem alloc] initWithTitle:title action:nil keyEquivalent:@""];
    [menuItem setTag:-1];
    
    NSMenuItem* oldMenuItem = [[self dockMenu] itemWithTag:-1];
    if(oldMenuItem) {
        [[self dockMenu] removeItem:oldMenuItem];
    }
    [[self dockMenu] insertItem:menuItem atIndex:0];
    
    [[[self dockMenu] itemWithTag:1] setTitle:([_provider isPlaying] ? @"Pause" : @"Play")];
    
    return [self dockMenu];
}

@end
