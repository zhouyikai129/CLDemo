//
//  UIImage+CLQRCode.h
//  CLDemo
//
//  Created by AUG on 2019/4/5.
//  Copyright © 2019 JmoVxia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CLQRCodeCorrectionLevel) {
    CLQRCodeCorrectionLevelLow, // 低纠正率.
    CLQRCodeCorrectionLevelNormal, // 一般纠正率.
    CLQRCodeCorrectionLevelSuperior, // 较高纠正率.
    CLQRCodeCorrectionLevelHight, // 高纠正率.
};


@interface CLCorrectionModel : NSObject

///二维码字符串
@property (nonatomic, copy, readonly) NSString *text;
///纠正等级，越高越容易识别，二维码越复杂
@property (nonatomic, assign, readonly) CLQRCodeCorrectionLevel correctionLevel;
///对应纠错率二维码矩阵点数宽度倍数(px) 10-100,越大越清晰，消耗资源越多，生成二维码越慢
@property (nonatomic, assign, readonly) NSInteger delta;
///随机颜色数组
@property (nonatomic, strong, readonly) NSMutableArray<UIColor *> *colorsArray;

/**
 初始化model

 @param text 二维码字符串
 @param correctionLevel 纠正等级，越高越容易识别，二维码越复杂
 @param delta 对应纠错率二维码矩阵点数宽度倍数(px) 10-100,越大越清晰，消耗资源越多，生成二维码越慢
 @return model
 */
- (instancetype)initWithText:(nonnull NSString *)text correctionLevel:(CLQRCodeCorrectionLevel) correctionLevel delta:(NSInteger) delta colorsArray:(NSMutableArray<UIColor *> *) colorsArray NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end



@interface UIImage (CLQRCode)

/**
 根据model生成二维码

 @param model model
 @return 二维码图片
 */
+(nullable UIImage *)generateQRCodeWithModel:(nonnull CLCorrectionModel *)model;


@end

NS_ASSUME_NONNULL_END
