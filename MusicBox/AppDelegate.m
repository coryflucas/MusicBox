//
//  AppDelegate.m
//  MusicBox
//
//  Created by Cory Lucas on 9/30/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import "AppDelegate.h"
#import "MusicServiceProvider.h"
#import "GoogleMusic/GoogleMusicProvider.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{    
    self.provider = [[GoogleMusicProvider alloc] initWithWebView: self.webView];
}

-(IBAction)playPause:(id)sender {
    [self.provider playPause];
}

-(IBAction)next:(id)sender {
    [self.provider next];
}

-(IBAction)previous:(id)sender {
    [self.provider previous];
}

@end
