//
//  TreeView.h
//  最全动画教程-树形动画
//
//  Created by GXY on 16/5/20.
//  Copyright © 2016年 Tangxianhai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeViewSub.h"
#import "TreeViewTrunk.h"

@interface TreeView : UIView

- (void)setMenuItems:(NSArray *)menuItems;
- (void)expend:(BOOL)isExpend;

@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) TreeViewTrunk *mainView;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGFloat endDistance;
@property (nonatomic) CGFloat nearDistance;
@property (nonatomic) CGFloat farDistance;

@property (nonatomic) BOOL isExpend;
@property (nonatomic) BOOL scale;


@end
