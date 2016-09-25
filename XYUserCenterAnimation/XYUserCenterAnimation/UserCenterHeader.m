//
//  UserCenterView.m
//  VapingTour
//
//  Created by smok on 16/9/9.
//  Copyright © 2016年 IVPS. All rights reserved.
//

#import "UserCenterHeader.h"

@implementation UserCenterHeader

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clipsToBounds = NO;
    self.bgImgView.clipsToBounds = YES;
}

- (void)layoutSubViewWhenScroll:(CGFloat) offsetY {
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    rect.origin.y += offsetY;
    rect.size.height -= offsetY;
    self.bgImgView.frame = rect;
}


@end
