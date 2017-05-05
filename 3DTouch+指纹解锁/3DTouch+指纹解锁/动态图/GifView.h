/**
 *  调用结束就开始播放动画，如果需要用户指定何时播放的话，只需要把timer的开始放到合适的位置。通过对CFDictonaryRaf 也就是gifProperties的改变，我们还可以控制动画是否循环播放以及循环多少次停止。
 
 通过对index的改变也可以控制动画从某帧开始播放。同理，同时改变index和count的话，也可以控制从某帧到某帧的播放。
 注意：- (void)stopGif;之后才可以退出这个类。否则timer不会关闭，产生内存泄露。
 */

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface GifView : UIImageView {
    CGImageSourceRef gif; // 保存gif动画
    NSDictionary *gifProperties;  // 保存gif动画属性
    size_t index;// gif动画播放开始的帧序号
    size_t count;// gif动画的总帧数
    NSTimer *timer;// 播放gif动画所使用的timer
}

- (id)initWithFrame:(CGRect)frame filePath:(NSString *)_filePath;
- (id)initWithFrame:(CGRect)frame data:(NSData *)_data;
- (void)stopGif;

- (NSData *)loadDataForIndex:(NSInteger)indeX ;



@end