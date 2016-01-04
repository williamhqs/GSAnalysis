//
//  GSGradientView.swift
//  Pods
//
//  Created by 胡秋实 on 25/12/2015.
//
//

import UIKit

@IBDesignable public class GSGradientView: UIView {
    
    //1 - the properties for the gradient
    @IBInspectable public var startColor: UIColor = UIColor.redColor()
    @IBInspectable public var endColor: UIColor   = UIColor.greenColor()
    
    @IBInspectable public var cornerSize: CGSize  = CGSize(width: 0, height: 0)
    
    //Draw gradient background and return gradient color
    func gradientBackground(rect: CGRect, context:CGContext) -> CGGradient{
        //Add Clip
        if cornerSize != CGSize(width: 0, height: 0) {
            UIBezierPath(roundedRect: rect,
                byRoundingCorners: UIRectCorner.AllCorners,
                cornerRadii: cornerSize).addClip()
        }
        let colors = [startColor.CGColor, endColor.CGColor]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColors(colorSpace,
            colors,
            colorLocations)
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context,
            gradient,
            startPoint,
            endPoint,
            CGGradientDrawingOptions.DrawsAfterEndLocation)
        return gradient!
    }
    
    override public func drawRect(rect: CGRect) {
        gradientBackground(rect,context: UIGraphicsGetCurrentContext()!)
    }

}
