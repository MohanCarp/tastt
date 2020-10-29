//
//  View.swift
//  HarishFrameworkSwift4
//
//  Created by Harish on 11/01/18.
//  Copyright © 2018 Harish. All rights reserved.
//

import UIKit
protocol LayoutParameters {
    var isBorder: Bool {get set}
    var border: Int {get set}
    var radious: Int {get set}
    var borderColor: UIColor? {get set}
    var isShadow: Bool {get set}
    var shadowCColor: UIColor? {get set}
    var lsOpacity: CGFloat {get set}
    var lsRadius: Int {get set}
    var lsOffWidth: CGFloat {get set}
    var lsOffHeight: CGFloat {get set}
    var isStrokeColor: Bool {get set}
    var classPara: ClassPara {get set}
    var bounds: CGRect {get set}
}
class ClassPara {
    var backgroundColor: UIColor!
    var shadowLayer: CAShapeLayer!
    var layer: CALayer!
}
extension NSObject {
    func strokeColor() {
        let ccc = UIGraphicsGetCurrentContext()
        ccc!.addRect(CGRect(x: 10.0, y: 10.0, width: 80.0, height: 80.0))
        ccc!.setStrokeColor(UIColor.red.cgColor)
        ccc!.strokePath()
    }
    func layoutSubviews(_ obb: LayoutParameters) {
        if obb.isShadow {
            if obb.classPara.shadowLayer == nil {
                let color = obb.classPara.backgroundColor
                obb.classPara.backgroundColor = UIColor.clear
                obb.classPara.shadowLayer = CAShapeLayer()
                obb.classPara.shadowLayer.path = UIBezierPath(roundedRect: obb.bounds,
                                                              cornerRadius: CGFloat(obb.radious)).cgPath
                obb.classPara.shadowLayer.fillColor = color?.cgColor
                obb.classPara.shadowLayer.shadowColor = obb.shadowCColor?.cgColor
                obb.classPara.shadowLayer.shadowPath = obb.classPara.shadowLayer.path
                obb.classPara.shadowLayer.shadowOffset = CGSize(width: obb.lsOffWidth,
                                                                height: obb.lsOffHeight)
                obb.classPara.shadowLayer.shadowOpacity = Float(obb.lsOpacity)
                obb.classPara.shadowLayer.shadowRadius = CGFloat(obb.lsRadius)
                obb.classPara.layer.insertSublayer(obb.classPara.shadowLayer, at: 0)
            }
        } else if obb.isBorder {
            doBorder(obb)
        }
    }
    func doBorder (_ obb: LayoutParameters) {
        obb.classPara.layer.masksToBounds = true
        if obb.borderColor != nil { obb.classPara.layer.borderColor = obb.borderColor?.cgColor }
        obb.classPara.layer.cornerRadius = CGFloat(obb.radious)
        obb.classPara.layer.borderWidth = CGFloat(obb.border)
    }
}
open class View: UIView, LayoutParameters {
    
    var classPara: ClassPara = ClassPara()
    
    @IBInspectable open var isBorder: Bool = false
    @IBInspectable open var border: Int = 0
    @IBInspectable open var radious: Int = 0
    @IBInspectable open var borderColor: UIColor?
    @IBInspectable open var isShadow: Bool = false
    @IBInspectable open var shadowCColor: UIColor?
    @IBInspectable open var lsOpacity: CGFloat = 0.5
    @IBInspectable open var lsRadius: Int = 0
    @IBInspectable open var lsOffWidth: CGFloat = 2.0
    @IBInspectable open var lsOffHeight: CGFloat = 2.0
    @IBInspectable open var isStrokeColor: Bool = false
    
    override open func draw(_ rect: CGRect) {
        if isStrokeColor {
            strokeColor()
        }
    }
    
    var shadowLayer: CAShapeLayer!
    override open func layoutSubviews() {
        super.layoutSubviews()
       // shadowCColor = UIColor.darkGray
        let obb = ClassPara ()
        obb.shadowLayer = shadowLayer
        obb.backgroundColor = backgroundColor
        obb.layer = layer
        classPara = obb
        layoutSubviews (self)
    }
}
public extension UIView {
    func border (_ color: UIColor?, _ cornerRadius: CGFloat, _ borderWidth: CGFloat) {
        self.layer.masksToBounds = true
        if color != nil {
            self.layer.borderColor = color?.cgColor
        }
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
    }
    func shadowSubViews () {
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
        let borderView = UIView()
        borderView.frame = self.bounds
        borderView.layer.cornerRadius = 10
        borderView.layer.borderColor = UIColor.black.cgColor
        borderView.layer.borderWidth = 1.0
        borderView.layer.masksToBounds = true
        self.addSubview(borderView)
        let otherSubContent = UIImageView()
        otherSubContent.frame = borderView.bounds
        borderView.addSubview(otherSubContent)
    }
    func shadow () {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = false
    }
    func shadow (_ color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = false
    }
    func shadow (_ radious: CGFloat, _ hoff: CGFloat) {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: hoff)
        //self.layer.
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = radious
        self.layer.masksToBounds = false
    }
    
    func clearBackground () {
        self.backgroundColor = UIColor.clear
    }
}

extension UIView {
    func x () -> CGFloat {
        return self.frame.origin.x
    }
    
    func y () -> CGFloat {
        return self.frame.origin.y
    }
    
    func width () -> CGFloat {
        return self.frame.size.width
    }
    
    func height () -> CGFloat {
        return self.frame.size.height
    }
}

class ShadowView: UIView {
    override open func draw(_ rect: CGRect) {
        if self.tag != 1 {
            self.tag = 315
        }
        
        self.backgroundColor = .clear
        
        self.dropShadow(radious: 8, extra1: self.tag)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .clear
    }
}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(radious: CGFloat, extra1: Int = 0, scale: Bool = true) {        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = radious
        
        var extra: CGFloat = 5
        
        var frame = bounds
        
        if extra1 > 300 && extra1 < 400 {
            let opacity = extra1 - 300
            
            extra = 5
            
            let shadowOpacity = Float(opacity) / 100
            
            layer.shadowOpacity = shadowOpacity
            
            frame.origin.x = frame.origin.x - extra
            frame.origin.y = frame.origin.y - extra
            frame.size.width = frame.size.width + (2 * extra)
            frame.size.height = frame.size.height + (2 * extra)
        } else if extra1 == 0 {
            extra = 5
            
            layer.shadowOpacity = 0.1
            
            frame.origin.x = frame.origin.x - extra
            frame.origin.y = frame.origin.y - extra
            frame.size.width = frame.size.width + (2 * extra)
            frame.size.height = frame.size.height + (2 * extra)
        } else {
            extra = 0
            
            layer.shadowOpacity = 0.02
            
            frame.origin.x = frame.origin.x - extra
            frame.origin.y = frame.origin.y - extra
            frame.size.width = frame.size.width + (2 * extra)
            frame.size.height = frame.size.height + (2 * extra)
        }
        
        layer.shadowPath = UIBezierPath(rect: frame).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
