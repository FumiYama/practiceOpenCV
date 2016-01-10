//
//  PracticeOpenCV.m
//  practiceOpenCV
//
//  Created by Fumiya Yamanaka on 2016/01/11.
//  Copyright © 2016年 Fumiya Yamanaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "practiceOpenCV-Bridging-Header.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

@implementation practiceOpenCV: NSObject

+(UIImage *)DetectEdgeWithImage:(UIImage *)image{
    //UIImageをcv::Matに変換
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    // 白黒濃淡画像
    cv::Mat gray;
    cv::cvtColor(mat, gray, CV_BGR2GRAY);
    
    //エッジ検出
    cv::Mat edge;
    cv::Canny(gray, edge, 200, 100);
    
    //cv::MatをUIImageに変換
    UIImage *edgeImg = MatToUIImage(edge);
    
    return edgeImg;
}

@end