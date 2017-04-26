//
//  PYWaveView.h
//  PYWaveView
//
//  Created by HXB on 2017/4/26.
//  Copyright © 2017年 liYaoPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PYWaveViewPathType_CIRCULAR = 0,//圆形
    PYWaveViewPathType_RECT = 1,//矩形
} PYWaveViewPathType;




@interface PYWaveView : UIView

#pragma mark - 必备参数
///是否冲浪(设置成YES开始冲浪，设置成NO停止冲浪。 默认为NO)
@property (nonatomic,assign) BOOL isWaveStart;

///需要画出的颜色数组
@property (nonatomic,strong) NSMutableArray<UIColor *> *colorMutableArray;
///高度或进度，占self.frame.size.height得百分比
@property (nonatomic,assign) CGFloat progress;

///self.backgroundColor
@property (nonatomic,strong) UIColor *waveViewBackgroundColor;




#pragma mark - 常用的方法
/**
 * 冲浪视图的类构造方法
 * @param colorMutableArray 颜色数组
 * @param progress 高度或进度，占self.frame.size.height得百分比
 */
+ (instancetype)waveViewWithFrame:(CGRect)frame andColorSet: (NSMutableArray <UIColor *>*)colorMutableArray andProgress: (CGFloat)progress;
/**
 * 冲浪视图的类构造方法
 * @param colorMutableArray 颜色数组
 * @param progress 高度或进度，占self.frame.size.height得百分比
 */
- (instancetype)initWithFrame:(CGRect)frame andColorSet: (NSMutableArray <UIColor *>*)colorMutableArray andProgress: (CGFloat)progress;




#pragma mark - 自定义水波参数 （内部有默认值设置）
///振幅 (水波的振幅)a（y = asin(wx+φ) + k）
@property (nonatomic, assign) CGFloat amplitude;
///水波的周期w
@property (nonatomic, assign) CGFloat cycle;
///两个波水平之间偏移的距离
@property (nonatomic, assign) CGFloat distanceH;
///两个波竖直之间偏移 
@property (nonatomic, assign) CGFloat distanceV;
///水波的速率(默认0.1)
@property (nonatomic, assign) CGFloat waveScale;

#pragma mark - 关于形状的展示
///自定义形状
@property (nonatomic, strong) UIBezierPath *bazierPath;
///形状类型，默认是圆形（分为矩形和圆形两种，如果设置了bazierPath属性，则优先按照bazierPath路径获取形状）
@property (nonatomic,assign) PYWaveViewPathType pathType;

@end
