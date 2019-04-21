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

@end


@implementation CLPopArrowView

-(instancetype)initWithOrigin:(CGPoint)origin Width:(CGFloat)width Height:(float)height Direction:(CLArrowDirection)direction
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)]) {
        self.backgroundColor=[UIColor clearColor];
        self.origin = origin;
        self.height = height;
        self.width = width;
        self.direction = direction;
        self.contentView = [[UIView alloc]initWithFrame:CGRectMake(origin.x, origin.y, width, height)];
        self.contentView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
        [self addSubview:self.contentView];
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGFloat startX = self.origin.x;
    CGFloat startY = self.origin.y;
    if (_direction==CLArrowDirectionLeftTop) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
    }else if (_direction==CLArrowDirectionLeftMiddle) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
    }else if (_direction==CLArrowDirectionLeftBottom) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
    }else if (_direction==CLArrowDirectionRightTop) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
    }else if (_direction==CLArrowDirectionRightMiddle) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
    }else if (_direction==CLArrowDirectionRightBottom) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
    }else if (_direction==CLArrowDirectionTopLeft) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
    }else if (_direction==CLArrowDirectionTopMiddle) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
    }else if (_direction==CLArrowDirectionTopRight) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX + 5, startY +5);
        CGContextAddLineToPoint(context, startX -5, startY+5);
    }else if (_direction==CLArrowDirectionBottomLeft) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 5, startY -5);
        CGContextAddLineToPoint(context, startX +5, startY-5);
    }else if (_direction==CLArrowDirectionBottomModdle) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 5, startY -5);
        CGContextAddLineToPoint(context, startX +5, startY-5);
    }else if (_direction==CLArrowDirectionBottomRight) {
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 5, startY -5);
        CGContextAddLineToPoint(context, startX +5, startY-5);
    }
    CGContextClosePath(context);
    [self.contentView.backgroundColor setFill];
    [self.backgroundColor setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
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
    NSArray *result=[self.contentView subviews];
    for (UIView *view in result) {
        view.hidden=YES;
    }
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    //动画效果弹出
    self.alpha = 0;
    
    if (_direction==CLArrowDirectionLeftTop) {
        self.contentView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x+5, self.origin.y-20, self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionLeftMiddle) {
        self.contentView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x+5, self.origin.y-self.height/2, self.width,self. height);
            
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionLeftBottom) {
        self.contentView.frame = CGRectMake(self.origin.x+5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x+5, self.origin.y-self.height+20, self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionRightTop) {
        self.contentView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x-5, self.origin.y-20, -self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionRightMiddle) {
        self.contentView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x-5, self.origin.y-self.height/2, -self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionRightBottom) {
        self.contentView.frame = CGRectMake(self.origin.x-5, self.origin.y, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x-5, self.origin.y-self.height+20, -self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionTopLeft) {
        self.contentView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x-20, self.origin.y+5, self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionTopMiddle) {
        self.contentView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x-self.width/2, self.origin.y+5, self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionTopRight) {
        self.contentView.frame = CGRectMake(self.origin.x, self.origin.y+5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x+20, self.origin.y+5, -self.width,self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionBottomLeft) {
        self.contentView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x-20, self.origin.y-5, self.width,-self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionBottomModdle) {
        self.contentView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x-self.width/2, self.origin.y-5, self.width,-self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }else if (_direction==CLArrowDirectionBottomRight) {
        self.contentView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            self.contentView.frame = CGRectMake(self.origin.x-self.width+20, self.origin.y-5, self.width,-self. height);
        }completion:^(BOOL finished) {
            NSArray *result=[self.contentView subviews];
            for (UIView *view in result) {
                view.hidden=NO;
            }
        }];
    }
}

-(void)dismiss
{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //动画效果淡出
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
        self.contentView.frame = CGRectMake(self.origin.x, self.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

@end
