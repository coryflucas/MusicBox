//
//  MusicServiceProvider.h
//  MusicBox
//
//  Created by Cory Lucas on 9/30/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface MusicServiceProvider : NSObject
@property WebView* webView;

-(id) initWithWebView:(WebView*) webView;

-(NSString*) baseUrl;
-(void) playPause;
-(void) next;
-(void) previous;

@end
