//
//  LFCameraResultView.h
//  CarMedia
//
//  Created by 张林峰 on 16/11/4.
//  Copyright © 2016年 张林峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFCameraResultView : UIView

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *btRephotograph;
@property (strong, nonatomic) UIButton *btUsePhoto;
@property (copy, nonatomic) void (^rephotographBlock)();//重拍
@property (copy, nonatomic) void (^usePhotoBlock)(UIImage *img);//使用

@end
