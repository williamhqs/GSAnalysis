//
//  GSGradientViewController.swift
//  GSAnalysis
//
//  Created by 胡秋实 on 4/1/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import GSAnalysis
class GSGradientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientView = GSGradientView(frame: CGRectMake(80,420,220,128))
        gradientView.startColor = UIColor.blueColor()
        gradientView.cornerSize = CGSize(width: 10, height: 10)
        gradientView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(gradientView)
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
