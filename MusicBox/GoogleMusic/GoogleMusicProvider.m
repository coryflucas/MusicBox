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

-(NSString*) currentTitle {
    return [[self webView] stringByEvaluatingJavaScriptFromString:@"document.getElementById('playerSongTitle').innerHTML"];
}

-(NSString*) currentArtist {
    return [[self webView] stringByEvaluatingJavaScriptFromString:@"document.getElementById('player-artist').innerHTML"];
}

-(NSString*) currentAlbum {
    return [[self webView] stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('player-album')[0].innerHTML"];
}

-(void) initStyle {
    NSString *hideGoogleBar = @"#gbzw, #gbx3 {display:none !important;}\n"
                              "#gbx1,#gb #gbx1,#gbq,#gbu,#gb #gbq,#gb #gbu {top:0px !important;}\n"
                              "#gb #gbu {top:0px !important;}\n"
                              "#gb .gbes#gbx1,#gb .gbes#gbx2,.gbesi#gb #gbx1,.gbesi#gb #gbx2,#gb .gbes#gbq,#gb .gbes#gbu,.gbesi#gb #gbq,.gbesi#gb #gbu {top:0px !important;}\n"
                              "#gb {height:73px !important;}\n"
                              ".gbem#gb,.gbemi#gb {height:73px !important;}\n"
                              ".gbes#gb,.gbesi#gb {height:46px !important;}\n"
                              "#gbbw {top:73px !important;}\n"
                              ".gbpl,.gbpr,#gbpx1,#gbpx2 {top:73px !important;}\n"
                              ".gbem#gb #gbbw,.gbemi#gb #gbbw {top:73px !important;}\n"
                              ".gbes#gb #gbbw,.gbesi#gb #gbbw {top:46px !important;}";
    [self injectCSS:hideGoogleBar];
}

-(void) execAction:(NSString*) action {
    [[self webView] stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"SJBpost('%@');", action]];
}

-(void) onFrameLoad {
    [self initStyle];
}

@end
