//
//  GSLineView.swift
//  GSAnalysis
//
//  Created by 胡秋实 on 5/1/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//



public class GSLineView: GSGradientView {

    public var points:[NSNumber] = [0]
    public let topBorder:CGFloat = 60
    public let bottomBorder:CGFloat = 50
    public let margin:CGFloat = 20.0
    
    var convertedPoints:[(CGFloat,CGFloat)] = []
    
    //If nil fill by solid color
    public var filledGradient: CGGradient?
    public var fillColor: UIColor?
    
    public var dotsColor: UIColor? = UIColor.whiteColor()
    public var lineColor: UIColor? = UIColor.whiteColor()
    
    private var myContext: CGContext?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.cornerSize = CGSizeMake(8, 8)
        self.backgroundColor = UIColor.clearColor()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.cornerSize = CGSizeMake(8, 8)
        self.backgroundColor = UIColor.clearColor()
    }
    
    //Make points useable
    func calculateX(index:Int,_ rect:CGRect) -> CGFloat{
        let spacer = (rect.width - self.margin*2 - 4) /
            CGFloat((self.points.count - 1))
        var x:CGFloat = CGFloat(index) * spacer
        x += self.margin + 2
        return x
    }
    
    func calculateY(pointY:CGFloat,_ rect:CGRect) -> CGFloat{
        let graphHeight = rect.height - topBorder - bottomBorder
        let maxValue = points.maxElement{$0.0.floatValue<$0.1.floatValue}
        var y:CGFloat = CGFloat(pointY) /
            CGFloat(maxValue!) * graphHeight
        y = (graphHeight + self.topBorder) - y
        return y
    }
    
    func calculatePoints(var pointsArgu:[(CGFloat,CGFloat)],rect: CGRect) -> [(CGFloat,CGFloat)] {
        for i in 0..<self.points.count {
            pointsArgu.append(calculateX(i,rect),calculateY(CGFloat(points[i]),rect))
        }
        return pointsArgu
    }
    
    func drawTopLines(rect: CGRect) -> UIBezierPath{
        myContext = UIGraphicsGetCurrentContext()
        
        //Calculate Points
        self.convertedPoints = calculatePoints(self.convertedPoints, rect: rect)
        
        //Draw Lines
        lineColor?.setStroke()
        
        let graphPath = UIBezierPath()
        graphPath.moveToPoint(CGPoint(x:convertedPoints.first!.0,
            y:convertedPoints.first!.1))
        
        for point in convertedPoints{
            graphPath.addLineToPoint(CGPointMake(point.0,point.1))
        }
        graphPath.stroke()
        CGContextSaveGState(myContext)
        return graphPath
    }
    
    func drawCirclePoints() {
        for point in self.convertedPoints {
            var pointT = CGPoint(x: point.0, y: point.1)
            pointT.x -= CGFloat(5.0/2)
            pointT.y -= CGFloat(5.0/2)
            let circle = UIBezierPath(ovalInRect:
                CGRect(origin: pointT,
                    size: CGSize(width: 5.0, height: 5.0)))
            dotsColor?.setFill()
            circle.fill()
        }
    }
    
    func fillInTheArea(rect: CGRect) {
        let firstPath = self.drawTopLines(rect)
        let secondPath = firstPath.copy() as! UIBezierPath
        
        //        //To make a close up area, till view bottom
        secondPath.addLineToPoint(CGPoint(x: convertedPoints.last!.0,y:rect.height))
        secondPath.addLineToPoint(CGPoint(x:convertedPoints.first!.0,y:rect.height))
        secondPath.closePath()
        secondPath.addClip()
        
        if let fillColor = fillColor {
            fillColor.setFill()
            secondPath.fill()
        }else{
            if filledGradient == nil {
                filledGradient = self.gradient
            }
            let maxYPoint = convertedPoints.map{$0.1}.minElement()
            let startPoint = CGPoint(x:margin, y: maxYPoint!)
            let endPoint = CGPoint(x:margin, y:self.bounds.height)
            CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), filledGradient, startPoint, endPoint, CGGradientDrawingOptions.DrawsAfterEndLocation)
        }
        
        firstPath.lineWidth = 2.0
        firstPath.stroke()
    }
    
    func drawScaleLines(rect: CGRect) {
        let linePath = UIBezierPath()
        
        //top line
        linePath.moveToPoint(CGPoint(x:margin, y: topBorder))
        linePath.addLineToPoint(CGPoint(x: rect.width - margin,
            y:topBorder))
        
        //center line
        let maxYPoint = convertedPoints.map{$0.1}.maxElement()
        
        linePath.moveToPoint(CGPoint(x:margin,
            y: maxYPoint!/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:rect.width - margin,
            y:maxYPoint!/2 + topBorder))
        
        //bottom line
        linePath.moveToPoint(CGPoint(x:margin,
            y:rect.height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:rect.width - margin,
            y:rect.height - bottomBorder))
        let color = UIColor(white: 1.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
    }
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)

        self.fillInTheArea(rect)
        
        CGContextRestoreGState(myContext)
        
        self.drawCirclePoints()
        
        self.drawScaleLines(rect)
    }
    

}
