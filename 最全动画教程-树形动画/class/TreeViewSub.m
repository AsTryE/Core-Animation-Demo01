//
//  TreeViewSub.m
//  最全动画教程-树形动画
//
//  Created by GXY on 16/5/20.
//  Copyright © 2016年 Tangxianhai. All rights reserved.
//

#import "TreeViewSub.h"

@implementation TreeViewSub

- (instancetype)initWithFrame:(CGRect)frame Image:(NSString *)img {
    if (self = [super initWithFrame:frame]) {
        UIImage *image = [UIImage imageNamed:img];
        UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
        imageV.frame = frame;
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageV];
    }
    return self;
}

@end
