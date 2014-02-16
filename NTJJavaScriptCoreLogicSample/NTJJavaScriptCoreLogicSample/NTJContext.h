//
//  NTJContext.h
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 16/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@interface NTJContext : JSContext

- (void)loadScript:(NSString *)script;

@end
