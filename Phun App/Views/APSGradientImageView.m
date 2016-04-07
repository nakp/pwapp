//
//  APSGradientImageView.m
//  Phun App
//
//  Created by Tomás Figueroa on 4/6/16.
//  Copyright © 2016 Applaudo. All rights reserved.
//

#import "APSGradientImageView.h"

@interface APSGradientImageView ()

@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@end

@implementation APSGradientImageView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addGradient];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addGradient];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        [self addGradient];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    self = [super initWithImage:image highlightedImage:highlightedImage];
    if (self) {
        [self addGradient];
    }
    return self;
}

- (void)addGradient
{
    // Agregar gradiente a partir del 40% de la imagen hasta el final
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    self.gradientLayer = gradientLayer;
    gradientLayer.frame = self.bounds;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.colors = @[ (id)[UIColor clearColor].CGColor, (id)[UIColor whiteColor].CGColor ];
    [self.layer addSublayer:gradientLayer];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
