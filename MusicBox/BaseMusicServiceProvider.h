//
//  MusicServiceProvider.h
//  MusicBox
//
//  Created by Cory Lucas on 9/30/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "MusicServiceProvider.h"

@interface BaseMusicServiceProvider : NSObject <MusicServiceProvider>
@property WebView* webView;

- (id)initWithWebView:(WebView *)webView;
- (void)injectCSS:(NSString *)cssContent;


@end
