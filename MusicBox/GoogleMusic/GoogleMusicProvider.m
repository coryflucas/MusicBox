//
//  GoogleMusicProvider.m
//  MusicBox
//
//  Created by Cory Lucas on 9/30/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import "GoogleMusicProvider.h"
#import <WebKit/WebKit.h>

@implementation GoogleMusicProvider
@synthesize webView;

-(NSString*) baseUrl {
    return @"http://www.google.com/music";
}

-(void) playPause {
    [self execAction:@"playPause"];
}

-(void) next {
    [self execAction:@"nextSong"];
}

-(void) previous {
    [self execAction:@"prevSong"];
}

-(void) execAction:(NSString*) action {
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"SJBpost('%@')", action]];
}

@end
