//
//  CLPopArrowView.m
//  CLDemo
//
//  Created by AUG on 2019/4/21.
//  Copyright © 2019 JmoVxia. All rights reserved.
//

#import "CLPopArrowView.h"

@interface CLPopArrowView ()

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CLArrowDirection direction;

///shapeLayer
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end


@implementation CLPopArrowView

-(instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width Height:(float)height direction:(CLArrowDirection)direction
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)]) {
        self.backgroundColor = [UIColor clearColor];
        self.origin = origin;
        self.height = height;
        self.width = width;
        self.direction = direction;
        self.contentView = [[UIView alloc]initWithFrame:CGRectMake(origin.x, origin.y, width, height)];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.contentView];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    
    CGFloat spaceWidth = 10;
    
    CGFloat startX = CGRectGetMinX(self.contentView.frame);
    CGFloat startY = CGRectGetMinY(self.contentView.frame);

    CGFloat width = CGRectGetWidth(self.contentView.frame);
    CGFloat height = CGRectGetHeight(self.contentView.frame);

    CGPoint point1 = CGPointZero;
    CGPoint point2 = CGPointZero;
    CGPoint point3 = CGPointZero;
    CGPoint point4 = CGPointZero;
    CGPoint point5 = CGPointZero;
    CGPoint point6 = CGPointZero;
    CGPoint point7 = CGPointZero;
    CGPoint point8 = CGPointZero;
    
    if (_direction == CLArrowDirectionLeftTop || _direction == CLArrowDirectionLeftMiddle || _direction == CLArrowDirectionLeftBottom) {
        point1 = CGPointMake(self.origin.x, self.origin.y);
        point2 = CGPointMake(self.origin.x + spaceWidth, self.origin.y - spaceWidth);
        point3 = CGPointMake(startX, startY);
        point4 = CGPointMake(startX + width, startY);
        point5 = CGPointMake(startX + width, startY + height);
        point6 = CGPointMake(startX, startY + height);
        point7 = CGPointMake(startX, self.origin.y + spaceWidth);
        point8 = CGPointMake(self.origin.x, self.origin.y);
    }else if (_direction == CLArrowDirectionRightTop || _direction == CLArrowDirectionRightMiddle || _direction == CLArrowDirectionRightBottom) {
        point1 = CGPointMake(self.origin.x, self.origin.y);
        point2 = CGPointMake(self.origin.x - spaceWidth, self.origin.y - spaceWidth);
        point3 = CGPointMake(startX + width, startY);
        point4 = CGPointMake(startX, startY);
        point5 = CGPointMake(startX, startY + height);
        point6 = CGPointMake(startX + width, startY + height);
        point7 = CGPointMake(startX + width, self.origin.y + spaceWidth);
        point8 = CGPointMake(self.origin.x, self.origin.y);        
    }else if (_direction == CLArrowDirectionTopMiddle || _direction == CLArrowDirectionTopRight || _direction == CLArrowDirectionTopLeft) {
        point1 = CGPointMake(startX, startY);
        point2 = CGPointMake(self.origin.x - spaceWidth, startY);
        point3 = CGPointMake(self.origin.x, self.origin.y);
        point4 = CGPointMake(self.origin.x + spaceWidth, startY);
        point5 = CGPointMake(startX + width, startY);
        point6 = CGPointMake(startX + width, startY + height);
        point7 = CGPointMake(startX, startY + height);
        point8 = CGPointMake(startX, startY);
    }else if (_direction == CLArrowDirectionBottomRight || _direction == CLArrowDirectionBottomLeft || _direction == CLArrowDirectionBottomMiddle) {
        point1 = CGPointMake(startX + width, startY + height);
        point2 = CGPointMake(self.origin.x - spaceWidth, startY + height);
        point3 = CGPointMake(self.origin.x, self.origin.y);
        point4 = CGPointMake(self.origin.x + spaceWidth, startY + height);
        point5 = CGPointMake(startX, startY + height);
        point6 = CGPointMake(startX, startY);
        point7 = CGPointMake(startX + width, startY);
        point8 = CGPointMake(startX + width, startY + height);
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path addLineToPoint:point8];
    [path closePath];
    self.shapeLayer.path = path.CGPath;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.contentView]) {
        [self dismiss];
    }
}
-(void)popView
{
    CGFloat spaceWidth = 10;
    CGFloat marginWidth = 20;

    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    if (_direction==CLArrowDirectionLeftTop) {
        self.contentView.layer.anchorPoint = CGPointMake(0, 0);
        self.contentView.frame = CGRectMake(self.origin.x + spaceWidth, self.origin.y - marginWidth, self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionLeftMiddle) {
        self.contentView.layer.anchorPoint = CGPointMake(0, 0.5);
        self.contentView.frame = CGRectMake(self.origin.x + spaceWidth, self.origin.y - self.height * 0.5, self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionLeftBottom) {
        self.contentView.layer.anchorPoint = CGPointMake(0, 1);
        self.contentView.frame = CGRectMake(self.origin.x + spaceWidth, self.origin.y - self.height + marginWidth, self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionRightTop) {
        self.contentView.layer.anchorPoint = CGPointMake(1, 0);
        self.contentView.frame = CGRectMake(self.origin.x - spaceWidth, self.origin.y - marginWidth, -self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionRightMiddle) {
        self.contentView.layer.anchorPoint = CGPointMake(1, 0.5);
        self.contentView.frame = CGRectMake(self.origin.x - spaceWidth, self.origin.y - self.height * 0.5, -self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionRightBottom) {
        self.contentView.layer.anchorPoint = CGPointMake(1, 1);
        self.contentView.frame = CGRectMake(self.origin.x - spaceWidth, self.origin.y - self.height + marginWidth, -self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionTopLeft) {
        self.contentView.layer.anchorPoint = CGPointMake(0, 0);
        self.contentView.frame = CGRectMake(self.origin.x - marginWidth, self.origin.y + spaceWidth, self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionTopMiddle) {
        self.contentView.layer.anchorPoint = CGPointMake(0.5, 0);
        self.contentView.frame = CGRectMake(self.origin.x - self.width * 0.5, self.origin.y + spaceWidth, self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionTopRight) {
        self.contentView.layer.anchorPoint = CGPointMake(1, 0);
        self.contentView.frame = CGRectMake(self.origin.x + marginWidth, self.origin.y + spaceWidth, -self.width,self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionBottomLeft) {
        self.contentView.layer.anchorPoint = CGPointMake(0, 1);
        self.contentView.frame = CGRectMake(self.origin.x - marginWidth, self.origin.y - spaceWidth, self.width,-self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionBottomMiddle) {
        self.contentView.layer.anchorPoint = CGPointMake(0.5, 1);
        self.contentView.frame = CGRectMake(self.origin.x - self.width * 0.5, self.origin.y - spaceWidth, self.width,-self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }else if (_direction==CLArrowDirectionBottomRight) {
        self.contentView.layer.anchorPoint = CGPointMake(1, 1);
        self.contentView.frame = CGRectMake(self.origin.x - self.width + marginWidth, self.origin.y - spaceWidth, self.width,-self.height);
        self.contentView.transform = CGAffineTransformMakeScale(0.3, 0.3);
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
}

-(void)dismiss
{
    self.contentView.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateWithDuration:0.2 animations:^{
        self.contentView.transform = CGAffineTransformMakeScale(0.15, 0.15);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

- (CAShapeLayer *) shapeLayer {
    if (_shapeLayer == nil) {
        _shapeLayer = [[CAShapeLayer alloc] init];
        _shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 3;
        [self.layer addSublayer:_shapeLayer];
    }
    return _shapeLayer;
}

@end
