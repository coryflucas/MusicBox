//
//  MusicServiceProvider.h
//  MusicBox
//
//  Created by Cory Lucas on 10/1/13.
//  Copyright (c) 2013 Cory Lucas. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MusicServiceProvider <NSObject>

-(NSString*) baseUrl;

@optional
-(void) playPause;
-(void) next;
-(void) previous;
-(NSString*) currentArtist;
-(NSString*) currentTitle;
-(BOOL) isPlaying;

-(void) onFrameLoad;

@end
