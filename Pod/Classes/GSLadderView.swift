//
//  JRLadderView.swift
//  JumpRope
//
//  Created by 胡秋实 on 9/12/2015.
//  Copyright © 2015 William Hu. All rights reserved.
//

import UIKit

extension UIColor {
    class func RGB(r: CGFloat, _ g: CGFloat, _ b:CGFloat, alpha: CGFloat = 1.0) -> UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
}

public class GSLadderView: UIView {

    lazy var titleLabel: UILabel = UILabel()
    
    lazy var points: [(CGFloat,CGFloat,CGFloat)] = {
        
        var ar = [(CGFloat,CGFloat)]()
        
        for var index = 0; index < 20; index++ {
            let y = Int(arc4random_uniform(UInt32(self.frame.height - 30.0 - 30.0)))
            ar.append((CGFloat(12.0+Double(index)*(10.0+2.0)),CGFloat(y)))
        }
        var pointsT = [(CGFloat,CGFloat,CGFloat)]()
        for p in ar {
            let height = self.frame.height - CGFloat(30.0 + p.1)
            pointsT.append((CGFloat(p.0),CGFloat(p.1),height))
        }
       return pointsT
    }()
    
    var rectColor = UIColor.RGB(121, 210, 199)
    
    // MARK: Life cycle
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        titleLabel.text          = "Today"
        titleLabel.textAlignment = .Right
        titleLabel.textColor     = UIColor.RGB(42,134,124)
        self.addSubview(titleLabel)
    }
    
    override public func drawRect(rect: CGRect) {
        self.drawBaseLine(from: CGPoint(x: 10, y: self.frame.height-30), to: CGPoint(x: self.frame.size.width - 10, y: self.frame.height-30), lineColor:UIColor.RGB(42,134,124))
        for var i = 0; i<points.count; i++ {
            if i%2 == 0 {
                self.drawLadder(point: points[i])
            }else{
                self.drawLadder(point: points[i],rectColor: self.rectColor)
            }
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRectMake(self.frame.width - 110, self.frame.height-30, 100, 40)
    }

    // MARK: Private Methods
    func drawBaseLine (from point1:CGPoint, to point2:CGPoint, lineColor color:UIColor) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2)
        CGContextSetStrokeColorWithColor(context, color.CGColor)
        CGContextMoveToPoint(context, point1.x, point1.y)
        CGContextAddLineToPoint(context, point2.x, point2.y)
        CGContextStrokePath(context)
    }
    
    func drawLadder(point p:(CGFloat,CGFloat,CGFloat), rectColor color:UIColor = UIColor.RGB(42,134,124)) {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddRect(context, CGRectMake(p.0, p.1, 10, p.2))
        CGContextSetFillColorWithColor(context,
            color.CGColor);
        CGContextFillPath(context);
    }
}
