//
//  TreeView.m
//  最全动画教程-树形动画
//
//  Created by GXY on 16/5/20.
//  Copyright © 2016年 Tangxianhai. All rights reserved.
//

#import "TreeView.h"


@implementation TreeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.startPoint = self.center;
        self.nearDistance = 30;
        self.farDistance = 60;
        self.endDistance = 30;
        self.mainView = [[TreeViewTrunk alloc] initWithFrame:CGRectMake(0, 0, 80, 80) Image:@"center"];
        [self addSubview:self.mainView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.startPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        self.nearDistance = 30;
        self.farDistance = 60;
        self.endDistance = 30;
        self.mainView = [[TreeViewTrunk alloc] initWithFrame:CGRectMake(0, 0, 80, 80) Image:@"center"];
        [self addSubview:self.mainView];
    }
    return self;
}

- (void)setMenuItems:(NSArray *)menuItems {
    if (_menuItems != menuItems) {
        _menuItems = menuItems;

        for (UIView *v in self.subviews) {
            if (v.tag >= 1000) {
                [v removeFromSuperview];
            }
        }
        // add the menu buttons
        int count = (int)[menuItems count];
        CGFloat cnt = 1;
        for (int i = 0; i < count; i ++) {
            TreeViewSub *item = [menuItems objectAtIndex:i];
            item.tag = 1000 + i;
            item.startPoint = self.startPoint;
            CGFloat pi =  M_PI / count;
            CGFloat endRadius = item.bounds.size.width / 2 + self.endDistance + _mainView.bounds.size.width / 2;
            CGFloat nearRadius = item.bounds.size.width / 2 + self.nearDistance + _mainView.bounds.size.width / 2;
            CGFloat farRadius = item.bounds.size.width / 2 + self.farDistance + _mainView.bounds.size.width / 2;
            item.endPoint = CGPointMake(self.startPoint.x + endRadius * sinf(pi * cnt),
                                        self.startPoint.y - endRadius * cosf(pi * cnt));
            item.nearPoint = CGPointMake(self.startPoint.x + nearRadius * sinf(pi * cnt),
                                         self.startPoint.y - nearRadius * cosf(pi * cnt));
            item.farPoint = CGPointMake(self.startPoint.x + farRadius * sinf(pi * cnt),
                                        self.startPoint.y - farRadius * cosf(pi * cnt));
            item.center = item.startPoint;
            self.mainView.center = item.center;
            [self addSubview:item];
            
            cnt += 2;
        }
        
        [self bringSubviewToFront:_mainView];
    }
}

- (void)expend:(BOOL)isExpend {
    _isExpend = isExpend;
    [self.menuItems enumerateObjectsUsingBlock:^(TreeViewSub *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (self.scale) {
            if (isExpend) {
                obj.transform = CGAffineTransformIdentity;
            } else {
                obj.transform = CGAffineTransformMakeScale(0.001, 0.001);
            }
        }
        [self addRotateAndPostisionForItem:obj toShow:isExpend];
    }];
}

- (void)addRotateAndPostisionForItem:(TreeViewSub *)item toShow:(BOOL)show {
    if (show) {
        CASpringAnimation *springAnimation = nil;
        if (self.scale) {
            springAnimation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
            springAnimation.damping = 5;
            springAnimation.stiffness = 100;
            springAnimation.mass = 1;
            springAnimation.duration = 0.5f;
            springAnimation.fromValue = [NSNumber numberWithFloat:0.2];
            springAnimation.toValue = [NSNumber numberWithFloat:1.0];
        }

        CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotateAnimation.values = @[@(M_PI), @(0.0)];
        rotateAnimation.duration = 0.5f;
        rotateAnimation.keyTimes = @[@(0.3), @(0.4)];

        CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        positionAnimation.duration = 0.5f;
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, item.startPoint.x, item.startPoint.y);
        CGPathAddLineToPoint(path, NULL, item.farPoint.x, item.farPoint.y);
        CGPathAddLineToPoint(path, NULL, item.nearPoint.x, item.nearPoint.y);
        CGPathAddLineToPoint(path, NULL, item.endPoint.x, item.endPoint.y);
        positionAnimation.path = path;
        CGPathRelease(path);


        CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
        if (self.scale) {
            animationgroup.animations = @[positionAnimation, rotateAnimation,springAnimation];
        } else {
            animationgroup.animations = @[positionAnimation, rotateAnimation];
        }
        animationgroup.duration = 0.5f;
        animationgroup.fillMode = kCAFillModeForwards;
        animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [item.layer addAnimation:animationgroup forKey:@"Expand"];
        item.center = item.endPoint;
    } else {
        CASpringAnimation *springAnimation = nil;
        if (self.scale) {
            springAnimation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
            springAnimation.damping = 5;
            springAnimation.stiffness = 100;
            springAnimation.mass = 1;
            springAnimation.duration = 0.5f;
            springAnimation.fromValue = [NSNumber numberWithFloat:1.0];
            springAnimation.toValue = [NSNumber numberWithFloat:0.7];
        }

        CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotateAnimation.values = @[@0, @(M_PI * 2), @(0)];
        rotateAnimation.duration = 0.5f;
        rotateAnimation.keyTimes = @[@0, @(0.4), @(0.5)];
        CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        positionAnimation.duration = 0.5f;
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, item.endPoint.x, item.endPoint.y);
        CGPathAddLineToPoint(path, NULL, item.farPoint.x, item.farPoint.y);
        CGPathAddLineToPoint(path, NULL, item.startPoint.x, item.startPoint.y);
        positionAnimation.path = path;
        CGPathRelease(path);

        CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
        if (self.scale) {
            animationgroup.animations = @[positionAnimation, rotateAnimation,springAnimation];
        } else {
            animationgroup.animations = @[positionAnimation, rotateAnimation];
        }

        animationgroup.duration = 0.5f;
        animationgroup.fillMode = kCAFillModeForwards;
        animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [item.layer addAnimation:animationgroup forKey:@"Close"];
        item.center = item.startPoint;
    }
}

@end
