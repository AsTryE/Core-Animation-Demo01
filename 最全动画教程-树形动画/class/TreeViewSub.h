//
//  TreeViewSub.h
//  最全动画教程-树形动画
//
//  Created by GXY on 16/5/20.
//  Copyright © 2016年 Tangxianhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TreeViewSub : UIView

- (instancetype)initWithFrame:(CGRect)frame Image:(NSString *)img;

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) CGPoint nearPoint;
@property (nonatomic, assign) CGPoint farPoint;
@end
