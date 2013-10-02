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
    GoogleMusicProvider *provider = [[GoogleMusicProvider alloc] initWithWebView: self.webView];
    [self setProvider: provider];
    
    [AppleMediaKeyController sharedController];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(playPause) name:MediaKeyPlayPauseNotification object:nil];
    [center addObserver:self selector:@selector(next) name:MediaKeyNextNotification object:nil];
    [center addObserver:self selector:@selector(previous) name:MediaKeyPreviousNotification object:nil];
}

-(void)playPause {
    [self.provider playPause];
    [self logTrackInfo];
}

-(void)next {
    [self.provider next];
    [self logTrackInfo];
}

-(void)previous {
    [self.provider previous];
    [self logTrackInfo];
}

-(void)logTrackInfo {
    NSLog(@"%@ by %@ on %@", [[self provider] currentTitle], [[self provider] currentArtist], [[self provider] currentAlbum]);
}

@end
