//
//  CLCustomQRCodeViewController.m
//  CLDemo
//
//  Created by AUG on 2019/4/5.
//  Copyright © 2019 JmoVxia. All rights reserved.
//

#import "CLCustomQRCodeViewController.h"
#import "UIImage+CLQRCode.h"

@interface CLCustomQRCodeViewController ()

///imageView
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CLCustomQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:self.imageView];

    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    CLCorrectionModel *model = [[CLCorrectionModel alloc] initWithText:@"https://www.baidu.com/" correctionLevel:CLQRCodeCorrectionLevelHight delta:100 colorsArray:@[[UIColor orangeColor], [UIColor redColor]]];
    self.imageView.image = [UIImage generateQRCodeWithModel:model];
    self.imageView.center = self.view.center;
}


@end
