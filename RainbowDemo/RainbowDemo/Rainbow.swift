//
//  Rainbow.swift
//  RainbowDemo
//
//  Created by Gollum on 2016/11/5.
//  Copyright © 2016年 Gollum. All rights reserved.
//

import UIKit
@IBDesignable
class Rainbow: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor(red: (37.0/255.0), green: (252.0/255), blue: (244.0/255.0), alpha: 1.0)
    @IBInspectable var secondColor: UIColor = UIColor(red: (171.0/255.0), green: (250.0/255), blue: (81.0/255.0), alpha: 1.0)
    @IBInspectable var thirdColor: UIColor = UIColor(red: (238.0/255.0), green: (32.0/255), blue: (53.0/255.0), alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        //super
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    //重写drawrect方法
    override func draw(_ rect: CGRect) {
        //添加圆弧
        addCircle(arcRadius: 80, capRadius: 20, color: firstColor)
        addCircle(arcRadius: 150, capRadius: 20, color: secondColor)
        addCircle(arcRadius: 215, capRadius: 20, color: thirdColor)
        
    }
    
    func addCircle(arcRadius: CGFloat, capRadius: CGFloat, color: UIColor) {
        
        //        let x = CGRectGetMidX(bounds)
        let x = bounds.midX
        let y = bounds.midY
        
       //底部圆弧
        let pathBottom = UIBezierPath(ovalIn: CGRect(x: (x - (arcRadius / 2)), y: (y - (arcRadius / 2)), width: arcRadius, height: arcRadius)).cgPath
        addOval(lineWidth: 20.0, path: pathBottom, strokeStart: 0, strokeEnd: 0.5, strokeColor: color, fillColor: UIColor.clear, shadowRadius: 0, shadowOpacity: 0, shadowOffset: CGSize.zero)
        
        //中间圆弧
        let pathMiddle = UIBezierPath(ovalIn: CGRect(x: (x - (capRadius / 2)) - (arcRadius / 2), y: (y - (capRadius / 2)), width: capRadius, height: capRadius)).cgPath
        addOval(lineWidth: 0.0, path: pathMiddle, strokeStart: 0, strokeEnd: 1.0, strokeColor: color, fillColor: color, shadowRadius: 5.0, shadowOpacity: 0.5, shadowOffset: CGSize.zero)

        //顶部圆弧
        let pathTop = UIBezierPath(ovalIn: CGRect(x: (x - (arcRadius / 2)), y: (y - (arcRadius / 2)), width: arcRadius, height: arcRadius)).cgPath
        addOval(lineWidth: 20.0, path: pathTop, strokeStart: 0.5, strokeEnd: 1.0, strokeColor: color, fillColor: UIColor.clear, shadowRadius: 0, shadowOpacity: 0, shadowOffset: CGSize.zero)
        }
    
    func addOval(lineWidth: CGFloat, path: CGPath, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffset: CGSize) {
        
        let arc = CAShapeLayer()
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.cgColor
        arc.fillColor = fillColor.cgColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffset
        layer.addSublayer(arc)
    }

    }
