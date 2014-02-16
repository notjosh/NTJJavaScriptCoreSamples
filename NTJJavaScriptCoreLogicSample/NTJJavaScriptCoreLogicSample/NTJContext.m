//
//  NTJContext.m
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 16/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import "NTJContext.h"

#import <JavaScriptCore/JavaScriptCore.h>

@implementation NTJContext

- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithVirtualMachine:(JSVirtualMachine *)virtualMachine
{
    self = [super initWithVirtualMachine:virtualMachine];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    __weak typeof(self) weakSelf = self;

    self[@"require"] = ^(NSString *str){
        NSString *contents = [weakSelf contentsOfJSResource:str];

        JSContext *requireContext = [[JSContext alloc] initWithVirtualMachine:[JSContext currentContext].virtualMachine];
        requireContext[@"exports"] = @{};
        requireContext[@"module"] = @{@"exports": [NSDictionary dictionary]};

        [requireContext evaluateScript:contents];

        return requireContext[@"exports"];
    };

#if DEBUG
    self.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        NSLog(@"EXC: %@", exception);
    };
#endif
}

- (void)loadScript:(NSString *)str
{
    NSString *contents = [self contentsOfJSResource:str];
    [self evaluateScript:contents];
}

#pragma mark - Helper

- (NSString *)contentsOfJSResource:(NSString *)str
{
    NSError *error;
    NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"js"];
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
}

@end
