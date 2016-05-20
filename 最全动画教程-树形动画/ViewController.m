//
//  ViewController.m
//  最全动画教程-树形动画
//
//  Created by GXY on 16/5/20.
//  Copyright © 2016年 Tangxianhai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) IBOutlet TreeView *tView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    TreeViewSub *sub1 = [[TreeViewSub alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"s1"];
    TreeViewSub *sub2 = [[TreeViewSub alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"s2"];
    TreeViewSub *sub3 = [[TreeViewSub alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"s3"];
    TreeViewSub *sub4 = [[TreeViewSub alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"s4"];
    TreeViewSub *sub5 = [[TreeViewSub alloc] initWithFrame:CGRectMake(0, 0, 60, 60) Image:@"s4"];

    NSArray *items = @[sub1,
                       sub2,
                       sub3,
                       sub4,
                       sub5
                       ];

    self.tView.scale = YES;

    [self.tView setMenuItems:items];
}

- (IBAction)expendAction:(UIButton *)sender {
    if (self.tView.isExpend) {
        [sender setTitle:@"显示" forState:UIControlStateNormal];
        [self.tView expend:NO];
    }
    else {
        [sender setTitle:@"隐藏" forState:UIControlStateNormal];
        [self.tView expend:YES];
    }
}
@end
