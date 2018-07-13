//
//  LBColorButton.swift
//  LBColorButton
//
//  Created by 李博 on 2017/10/11.
//  Copyright © 2017年 liboy. All rights reserved.
//

import UIKit


enum GradientType: Int {
    case topToBottom         // 从上到下
    case leftToRight        // 从左到右
    case upLeftTolowRight    //左上到右下
    case upRightTolowLeft    //右上到左下
}

class LBColorButton: UIButton {

    //建议颜色设置为2个相近色为佳，设置3个相近色能形成拟物化的凸起感
    init(frame: CGRect, colorArray:Array<UIColor>, gradientType:GradientType) {
        super.init(frame: frame)
        
        let backImg = buttonImg(colors: colorArray, gradientType: gradientType)
        setBackgroundImage(backImg, for: .normal)
        self.layer.cornerRadius = 4.0
        self.layer.masksToBounds = true
        
        setViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setViewLayer() {
        
        let backgroundLayer = CAShapeLayer(layer: layer)
        
        backgroundLayer.shadowOpacity = 0.9
        backgroundLayer.shadowColor = UIColor.black.cgColor
        backgroundLayer.shadowOffset = CGSize(width: 0, height: 3)
        backgroundLayer.shadowRadius = 3
        
        layer.insertSublayer(backgroundLayer, at: 0)
        
    }

    
    func buttonImg(colors:Array<UIColor>,gradientType:GradientType) -> UIImage {
        
        var arrM = [CGColor]()
        for color in colors {
            arrM.append(color.cgColor)
        }
        UIGraphicsBeginImageContextWithOptions(frame.size, true, 1)
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        let colorSpace = arrM.last?.colorSpace
        let gradient = CGGradient(colorsSpace: colorSpace, colors: arrM as CFArray, locations: nil)
        
        var start:CGPoint? = nil
        var end:CGPoint? = nil
        
        switch gradientType.rawValue {
        case 0:
            start = CGPoint(x: 0.0, y: 0.0)
            end = CGPoint(x: 0.0, y: frame.size.height)
        case 1:
            start = CGPoint(x: 0.0, y: 0.0)
            end = CGPoint(x: frame.size.width, y: 0.0)
        case 2:
            start = CGPoint(x: 0.0, y: 0.0)
            end = CGPoint(x: frame.size.width, y: frame.size.height)
        case 3:
            start = CGPoint(x: frame.size.width, y: 0.0)
            end = CGPoint(x: 0.0, y: frame.size.height)
        default:
            break
        }
        context?.drawLinearGradient(gradient!, start: start!, end: end!, options: .drawsBeforeStartLocation)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        context?.restoreGState()
        UIGraphicsEndImageContext()
        return image!
    }
}
