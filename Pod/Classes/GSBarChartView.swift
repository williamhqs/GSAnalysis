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

public class GSBarChartView: UIView {

    // X and Y axle title
    public lazy var xTitleLabel: UILabel = UILabel()
    public lazy var yTitleLabel: UILabel = UILabel()
    
    // The space between two bars
    public var barSpace: CGFloat = 2.0 {
        didSet{
            realPoints = self.configurePoints()
        }
    }
    // bar width
    public var barWidth: CGFloat = 10.0 {
        didSet{
            realPoints = self.configurePoints()
        }
    }
    
    public var points: [NSNumber] = [0] {
        didSet{
            realPoints = self.configurePoints()
        }
    }
    
    // X and Y axel height
    public var baseLineHeight:CGFloat = 2.0
    
    // points is the datasource of the bar chart, the tuple is (x, y, height)
    var realPoints: [(CGFloat,CGFloat,CGFloat)] = [(0,0,0)]
    
    public var leftMargin: CGFloat   = 30.0
    public var rightMargin: CGFloat  = 30.0
    public var topMargin: CGFloat    = 30.0
    public var bottomMargin: CGFloat = 30.0
    
    // change bar color
    public var barColor1 = UIColor.RGB(121, 210, 199)
    public var barColor2 = UIColor.RGB(42,134,124)
    public var baseLineColor = UIColor.RGB(42,134,124)
    
    // MARK: Life cycle
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        basicConfigure()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        basicConfigure()
    }
    
    override public func drawRect(rect: CGRect) {
        
        //X
        self.drawBaseLine(from: CGPoint(x: leftMargin, y: self.frame.height-self.bottomMargin), to: CGPoint(x: self.frame.size.width - rightMargin, y: self.frame.height-bottomMargin), lineColor:baseLineColor)
        //Y
        self.drawBaseLine(from: CGPoint(x: leftMargin, y: self.frame.height-self.bottomMargin+baseLineHeight/2), to: CGPoint(x: leftMargin, y: topMargin-10), lineColor:baseLineColor)
        
        // Y axel dash line
        self.drawBaseLine(from: CGPoint(x: leftMargin-baseLineHeight, y: topMargin), to: CGPoint(x: leftMargin+baseLineHeight, y: topMargin), lineColor:baseLineColor)
        
        for var i = 0; i<realPoints.count; i++ {
            if i%2 == 0 {
                self.drawChart(point: realPoints[i], rectColor:self.barColor2)
            }else{
                self.drawChart(point: realPoints[i],rectColor: self.barColor1)
            }
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        xTitleLabel.frame = CGRectMake(0, self.frame.height-bottomMargin, self.frame.width, 40)
        yTitleLabel.frame = CGRectMake(0, topMargin-10, leftMargin, 20)
    }

    // MARK: Private Methods
    
    func configurePoints() -> [(CGFloat,CGFloat,CGFloat)] {
        var pointsT = [(CGFloat,CGFloat,CGFloat)]()
        let maxHeight = points.maxElement { (a:NSNumber, b:NSNumber) -> Bool in
            a.floatValue < b.floatValue
        }

        for var index = 0; index < points.count; index++ {
            //测试随机高度
//            let y = Int(arc4random_uniform(UInt32(self.frame.height - self.topMargin - self.bottomMargin)))

            let realFrameHeight = self.frame.height - self.topMargin - self.bottomMargin
            
            let height          = realFrameHeight*CGFloat(points[index])/CGFloat(maxHeight!)
            let y               = self.frame.height - bottomMargin - height

            pointsT.append((barWidth + CGFloat(Double(leftMargin)+Double(index)*Double(self.barWidth+self.barSpace)),y,CGFloat(height)))
        }
        return pointsT
    }
    
    func basicConfigure() {
        xTitleLabel.text          = "X-title"
        xTitleLabel.textAlignment = .Right
        xTitleLabel.font            = UIFont.systemFontOfSize(12.0)
        xTitleLabel.textColor     = UIColor.RGB(42,134,124)
        self.backgroundColor      = UIColor.clearColor()
        
        yTitleLabel.text            = "Y-title"
        yTitleLabel.font            = UIFont.systemFontOfSize(12.0)
        yTitleLabel.backgroundColor = UIColor.clearColor()
        yTitleLabel.textAlignment   = .Center
        yTitleLabel.textColor       = self.baseLineColor

        self.addSubview(xTitleLabel)
        self.addSubview(yTitleLabel)
    }
    
    func drawBaseLine (from point1:CGPoint, to point2:CGPoint, lineColor color:UIColor) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, baseLineHeight)
        CGContextSetStrokeColorWithColor(context, color.CGColor)
        CGContextMoveToPoint(context, point1.x, point1.y+1)
        CGContextAddLineToPoint(context, point2.x, point2.y+1)
        CGContextStrokePath(context)
    }
    
    func drawChart(point p:(CGFloat,CGFloat,CGFloat), rectColor color:UIColor = UIColor.RGB(42,134,124)) {
        let context = UIGraphicsGetCurrentContext()
        CGContextAddRect(context, CGRectMake(p.0, p.1, barWidth, p.2))
        CGContextSetFillColorWithColor(context,
            color.CGColor);
        CGContextFillPath(context);
    }
}
