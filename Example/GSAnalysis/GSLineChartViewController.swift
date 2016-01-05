//
//  GSLineChartViewController.swift
//  GSAnalysis
//
//  Created by 胡秋实 on 25/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import GSAnalysis
class GSLineChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let lineView = GSLineView(frame: CGRect(x: 50,y: 200,width: 280,height: 200))
        lineView.points = [4, 1, 6, 10, 5, 8, 3]
        lineView.startColor = UIColor(red: 250/255.0, green: 233/255.0, blue: 222/255.0, alpha: 1.0)
        lineView.endColor = UIColor(red: 252/255.0, green: 79/255.0, blue: 8/255.0, alpha: 1.0)
        self.view.addSubview(lineView)
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
