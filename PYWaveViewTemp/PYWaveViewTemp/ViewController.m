//
//  ViewController.m
//  PYWaveViewTemp
//
//  Created by HXB on 2017/4/26.
//  Copyright © 2017年 liYaoPeng. All rights reserved.
//

#import "ViewController.h"
#import "PYWaveView.h"
@interface ViewController ()
@property (nonatomic,weak) PYWaveView *waveView;
//停止按钮的最大y值
@property (nonatomic,assign) CGFloat stopWaveViewMaxY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:.9 alpha:.8];
    
    //设置冲浪视图
    [self setupWaceView];
    
    //设置停止冲浪视图按钮
    [self setupEndWaceButton];
    
    //改变形状按钮
    [self setupWaceViewShape];
}


//MARK: 设置冲浪视图
- (void)setupWaceView {
    //波浪
    PYWaveView *waveView = [[PYWaveView alloc] init];
    self.waveView = waveView;
    [self.view addSubview:waveView];
    waveView.center = self.view.center;
    waveView.bounds = CGRectMake(0, 0, 300, 300);
    
    //waveView的形状
    waveView.pathType = PYWaveViewPathType_CIRCULAR;
    //进度（从下到上占得self.Height的比例）
    waveView.progress = 0.5;
    //颜色数组
    waveView.colorMutableArray = [self creatColorSet];
    //北京颜色数组
    waveView.waveViewBackgroundColor = [UIColor colorWithRed:0.9 green:0.8 blue:0.9 alpha:0.4];
    //色块之间横向的距离
    waveView.distanceH = 73;
    //色块之间纵向的距离
    waveView.distanceV = 4;
    //水波的振幅
    waveView.amplitude = 9;
    //水波的速率（别太大，会很快的，zz）
    waveView.waveScale = 0.2;
    //添加View
    [self.view addSubview:waveView];
    
    //MARK: 这个类一定要调用个方法才会开始冲浪
    waveView.isWaveStart = true;
}

//获取颜色数组
- (NSMutableArray <UIColor *>*)creatColorSet {
    UIColor *color1 = [UIColor colorWithRed:10/255.0 green:50/255.0 blue:255/255.0 alpha:0.20f];
    UIColor *color2 = [UIColor colorWithRed:20/255.0 green:100/255.0 blue:255/255.0 alpha:0.40f];
    UIColor *color3 = [UIColor colorWithRed:30/255.0 green:150/255.0 blue:255/255.0 alpha:0.60f];
    UIColor *color4 = [UIColor colorWithRed:60/255.0 green:200/255.0 blue:255/255.0 alpha:0.80f];
    UIColor *color5 = [UIColor colorWithRed:150/255.0 green:255/255.0 blue:255/255.0 alpha:.60f];
    return @[color1,color2,color3,color4,color5].mutableCopy;
}


//MARK: 停止冲浪
- (void)setupEndWaceButton {
    UIButton *button = [[UIButton alloc]init];
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
    button.bounds = CGRectMake(0, 0, 200, 50);
    //停止冲浪的按钮
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickEndWave:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点击停止冲浪" forState:UIControlStateNormal];
    [button setTitle:@"点击开始冲浪" forState:UIControlStateSelected];
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    self.stopWaveViewMaxY = button.frame.origin.y + button.frame.size.height;
    button.alpha = 0.7;
}

//MARK: 点击事件
- (void)clickEndWave: (UIButton *)button {
    self.waveView.isWaveStart = !self.waveView.isWaveStart;
    button.selected = !self.waveView.isWaveStart;
}

//MARK: 改变形状 按钮
- (void)setupWaceViewShape {
    UIButton *button = [[UIButton alloc]init];
    button.center = CGPointMake(self.view.center.x, self.stopWaveViewMaxY + 50);
    button.bounds = CGRectMake(0, 0, 100, 50);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickShapButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点击我变形" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}

- (void)setupPath {
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(150, 150)];
    [path addLineToPoint:CGPointMake(300, 0)];
    [path addLineToPoint:CGPointMake(300, 250)];
    [path addLineToPoint:CGPointMake(150, 300)];
    [path addLineToPoint:CGPointMake(0, 250)];
    [path closePath];
    self.waveView.bazierPath = path;
}

- (void)clickShapButton: (UIButton *)button {
    if (self.waveView.bazierPath) {
        self.waveView.bazierPath = nil;
        self.waveView.pathType = !self.waveView.pathType;
    }else{
        [self setupPath];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
