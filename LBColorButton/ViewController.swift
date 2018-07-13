//
//  ViewController.swift
//  LBColorButton
//
//  Created by 李博 on 2017/10/11.
//  Copyright © 2017年 liboy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colorArray = [UIColor.init(red: 0.3, green: 0.278, blue: 0.957, alpha: 1),UIColor.init(colorLiteralRed: 0.114, green: 0.623, blue: 0.843, alpha: 1)]
        let btn = LBColorButton(frame: CGRect.init(x: 100, y: 100, width: 150, height: 50), colorArray: colorArray, gradientType: GradientType.topToBottom)
        btn.setTitle("从上到下", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(btn)
        
        let colorArray1 = [UIColor.init(red:0.6, green:0.278, blue:0.757, alpha:1),UIColor.init(colorLiteralRed: 0.614, green: 0.623, blue: 0.843, alpha: 1)]
        let btn1 = LBColorButton(frame: CGRect.init(x: 100, y: 200, width: 150, height: 50), colorArray: colorArray1, gradientType: .leftToRight)
        btn1.setTitle("从左到右", for: .normal)
        btn1.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(btn1)
        
        let colorArray2 = [UIColor.init(red: 0.8, green: 0.278, blue: 0.957, alpha: 1),UIColor.init(colorLiteralRed: 0.846, green: 0.623, blue: 0.843, alpha: 1)]
        let btn2 = LBColorButton(frame: CGRect.init(x: 100, y: 300, width: 150, height: 50), colorArray: colorArray2, gradientType: GradientType.upLeftTolowRight)
        btn2.setTitle("左上到右下", for: .normal)
        btn2.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(btn2)
        
        let colorArray3 = [UIColor.colorWithHexString(hex: "#FFA370"),UIColor.colorWithHexString(hex: "#FF6166")]
        let btn3 = LBColorButton(frame: CGRect.init(x: 100, y: 400, width: 150, height: 50), colorArray: colorArray3, gradientType: GradientType.upLeftTolowRight)
        btn3.setTitle("右上到左下", for: .normal)
        btn3.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(btn3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIColor {
    class func colorWithHexString(hex:String) ->UIColor {
        
        var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            let index = cString.index(cString.startIndex, offsetBy:1)
            cString = cString.substring(from: index)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: rIndex)
        let otherString = cString.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    class func colorWithHexString(hex:String, alph:CGFloat) -> UIColor {
        
        var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            let index = cString.index(cString.startIndex, offsetBy:1)
            cString = cString.substring(from: index)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: rIndex)
        let otherString = cString.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alph))
    }
    
    
    
}

