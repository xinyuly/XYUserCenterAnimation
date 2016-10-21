//
//  UserCenterView.h
//  VapingTour
//
//  Created by smok on 16/9/9.
//  Copyright © 2016年 IVPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCenterHeader : UIView
@property (weak, nonatomic) IBOutlet UIImageView *avatarImgView;
@property (weak, nonatomic) IBOutlet UIImageView *sexImgView;
@property (weak, nonatomic) IBOutlet UILabel  *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel  *followingLabel;
@property (weak, nonatomic) IBOutlet UILabel  *followerLabel;
@property (weak, nonatomic) IBOutlet UIButton *followingBtn;
@property (weak, nonatomic) IBOutlet UIButton *followersBtn;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;

- (void)layoutSubViewWhenScroll:(CGFloat) offsetY;
@end
