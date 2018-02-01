//
//  NSObject+LoadGif.m
//  Git
//
//  Created by quanminqianbao on 2018/1/31.
//  Copyright © 2018年 yangshuquan. All rights reserved.
//

#import "NSObject+LoadGif.h"
#import "YYImage.h"
#import <objc/runtime.h>
#import "AppDelegate.h"

#define GitImageSize CGSizeMake(50,50)

@implementation NSObject (LoadGif)

- (UIImageView *)gitImageView{
    return   objc_getAssociatedObject(self, @selector(setGitImageView:));
}

- (void)setGitImageView:(UIImageView *)gitImageView{
    objc_setAssociatedObject(self, _cmd, gitImageView, OBJC_ASSOCIATION_RETAIN);
}

- (void)showGif{
    
    if (!self.gitImageView) {
        NSMutableArray *paths = @[].mutableCopy;
        NSString *basePath =  [[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"HUDGit.bundle/gif"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSDirectoryEnumerator *enumerator;
        enumerator = [fileManager enumeratorAtPath:basePath];
        NSString *fileName;
        while((fileName = [enumerator nextObject])) {
            [paths addObject:[basePath stringByAppendingPathComponent:fileName]];
        }
        
        
        UIImage *image = [[YYFrameImage alloc]initWithImagePaths:paths oneFrameDuration:0.05 loopCount:0];
        self.gitImageView = [[YYAnimatedImageView alloc] initWithImage:image];
        self.gitImageView.image = image;
        self.gitImageView.frame = CGRectMake((CGRectGetWidth(self.superView.frame)-GitImageSize.width)/2, (CGRectGetHeight(self.superView.frame)-GitImageSize.height)/2, GitImageSize.width, GitImageSize.height);
        [self.superView addSubview:self.gitImageView];
    }
    [self.gitImageView setHidden:NO];
    
}
- (void)hideGif{
    [self.gitImageView setHidden:YES];
}

- (UIView *)superView
{
    UIView * superview = nil;
    if ([[self class] isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController * ctr = (UINavigationController *)self;
        if ([ctr respondsToSelector:@selector(view)]) {
            superview = ctr.view;
        }
    }
    else if ([[self class] isSubclassOfClass:[UIViewController class]]) {
        UIViewController * ctr = (UIViewController *)self;
        if ([ctr respondsToSelector:@selector(view)]) {
            superview = ctr.view;
        }
    }
    else if ([[self class] isSubclassOfClass:[UIView class]]) {
        UIView * ctr = (UIView *)self;
        superview = ctr;
    }
    else if ([[self class] isSubclassOfClass:[UIWindow class]]) {
        UIWindow * ctr = (UIWindow *)self;
        superview = ctr;
        
    }
    else if ([[self class] isSubclassOfClass:[AppDelegate class]]) {
        AppDelegate * ctr = (AppDelegate *)self;
        superview = ctr.window;
    }else if([UIApplication sharedApplication].keyWindow ) {
        superview = [UIApplication sharedApplication].keyWindow;
    }
    return superview;
}

@end
