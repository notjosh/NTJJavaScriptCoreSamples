//
//  NTJThing.h
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 16/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@class NTJThing;

@protocol NTJThingJSExport <JSExport>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;

+ (NTJThing *)thing;

@end

@interface NTJThing : NSObject <NTJThingJSExport>

@end
