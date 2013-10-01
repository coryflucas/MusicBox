//
//  MusicServiceProvider.m
//  MusicBox
//
//  Created by Cory Lucas on 9/30/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import "MusicServiceProvider.h"

@implementation MusicServiceProvider

-(id) initWithWebView:(WebView *)view {
    self = [super init];
    
    if(self) {
        self.webView = view;
        
        NSURL *url = [NSURL URLWithString:[self baseUrl]];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [[[self webView] mainFrame] loadRequest:urlRequest];
    }
    
    return self;
}

@end
