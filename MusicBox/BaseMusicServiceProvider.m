//
//  MusicServiceProvider.m
//  MusicBox
//
//  Created by Cory Lucas on 9/30/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import "BaseMusicServiceProvider.h"

@implementation BaseMusicServiceProvider

-(id) initWithWebView:(WebView *)view {
    self = [super init];
    
    if(self) {
        [self setWebView:view];
        
        [view setFrameLoadDelegate:self];
        
        NSURL *url = [NSURL URLWithString:[self baseUrl]];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [[[self webView] mainFrame] loadRequest:urlRequest];
    }
    
    return self;
}

-(NSString*)baseUrl {
    [NSException raise:@"Not implemented" format:@"baseUrl should be implemented in subclass"];
    return nil; // unreachable
}

-(void) injectCSS:(NSString *)cssContent {
    DOMDocument* doc = [[self webView] mainFrameDocument];
    DOMElement* style = [doc createElement:@"style"];
    [style setAttribute:@"type" value:@"text/css"];
    [style appendChild:[doc createTextNode:cssContent]];
    [(DOMElement*)[[doc getElementsByTagName:@"head"] item:0] appendChild:style];
}

-(void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame {
    if([self respondsToSelector:@selector(onFrameLoad)])
        [self onFrameLoad];
}

@end
