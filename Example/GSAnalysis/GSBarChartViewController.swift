//
//  GSBarChartViewController.swift
//  GSAnalysis
//
//  Created by 胡秋实 on 23/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import GSAnalysis
class GSBarChartViewController: UIViewController {
   
    @IBOutlet weak var barChartFromNib: GSBarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add from storyboard
        barChartFromNib.titleLabel.text = "I am from Nib"
        barChartFromNib.points = [(0,0,100),(0,10,100),(0,0,90),(0,10,50),(0,0,70),(0,10,100),(0,0,100),(0,10,100),(0,0,90),(0,10,50),(0,0,20),(0,10,100)]
        
        //Add by code
        let frame = CGRect(x: barChartFromNib.frame.origin.x, y: barChartFromNib.frame.height + barChartFromNib.frame.origin.y + 50, width: 200, height: 100)
        let barChart = GSBarChartView(frame: frame)
        
        barChart.barSpace = 15.0
        
        barChart.barWidth = 15.0
        
        barChart.points = [(0,0,100),(0,10,100),(0,0,90),(0,10,50),(0,0,70),(0,10,100)]
        
        barChart.barColor1 = UIColor.redColor()
        barChart.barColor2 = UIColor.greenColor()
        barChart.baseLineColor = UIColor.blueColor()
        self.view.addSubview(barChart)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
