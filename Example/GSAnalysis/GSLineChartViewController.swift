//
//  GSLineChartViewController.swift
//  GSAnalysis
//
//  Created by 胡秋实 on 25/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit

class GSLineChartViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.scrollView.contentSize = CGSizeMake(320, 1000)
        self.scrollView.backgroundColor = UIColor.greenColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var sss: UIButton!

    @IBAction func test(sender: AnyObject) {
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
