//
//  ViewController.m
//  LFCamera
//
//  Created by 张林峰 on 2017/4/24.
//  Copyright © 2017年 张林峰. All rights reserved.
//

#import "ViewController.h"
#import "LFCameraResultView.h"
#import "LFCamera.h"

@interface ViewController ()

@property (strong, nonatomic) LFCamera *lfCamera;
@property (strong, nonatomic) LFCameraResultView *resultView;//结果view

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //本界面可以随便怎么设计，我这里只做个粗糙版。核心是LFCamera
    
    self.lfCamera = [[LFCamera alloc] initWithFrame:self.view.bounds];
    
    //拍摄有效区域（可不设置，不设置则不显示遮罩层和边框）
    self.lfCamera.effectiveRect = CGRectMake(20, 200, self.view.frame.size.width - 40, 280);
    [self.view insertSubview:self.lfCamera atIndex:0];
    
}


- (IBAction)takePhoto:(id)sender {
    [self.lfCamera takePhoto:^(UIImage *img) {
        self.resultView = [[LFCameraResultView alloc] initWithFrame:self.view.bounds];
        self.resultView.imageView.image = img;
        
        __weak ViewController *weakSelf = self;
        self.resultView.rephotographBlock = ^ {
            [weakSelf.lfCamera restart];
            
        };
        self.resultView.usePhotoBlock = ^(UIImage *img){
            
        };
        [self.view addSubview:self.resultView];
    }];
}

- (IBAction)lightOn:(id)sender {
    [self.lfCamera switchLight:LFCaptureFlashModeOn];
    NSLog(@"灯:%@",@([self.lfCamera getCaptureFlashMode]));
}

- (IBAction)lightOff:(id)sender {
    [self.lfCamera switchLight:LFCaptureFlashModeOff];
    NSLog(@"灯:%@",@([self.lfCamera getCaptureFlashMode]));
}

- (IBAction)lightAuto:(id)sender {
    [self.lfCamera switchLight:LFCaptureFlashModeAuto];
    NSLog(@"灯:%@",@([self.lfCamera getCaptureFlashMode]));
}

- (IBAction)switchFront:(id)sender {
    [self.lfCamera switchCamera:YES];
    NSLog(@"摄像头:%@",@([self.lfCamera isCameraFront]));
}

- (IBAction)switchBack:(id)sender {
    [self.lfCamera switchCamera:NO];
    NSLog(@"摄像头:%@",@([self.lfCamera isCameraFront]));
}

@end
