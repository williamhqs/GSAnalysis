
# GSAnalysis

GSAnalysis is a simple analysis graphic library written in swift. It includes Apple Health like analysis graphic view.

[![CI Status](http://img.shields.io/travis/William Hu/GSAnalysis.svg?style=flat)](https://travis-ci.org/William Hu/GSAnalysis)
[![Version](https://img.shields.io/cocoapods/v/GSAnalysis.svg?style=flat)](http://cocoapods.org/pods/GSAnalysis)
[![License](https://img.shields.io/cocoapods/l/GSAnalysis.svg?style=flat)](http://cocoapods.org/pods/GSAnalysis)
[![Platform](https://img.shields.io/cocoapods/p/GSAnalysis.svg?style=flat)](http://cocoapods.org/pods/GSAnalysis)

## Screenshot
<p align="center" >
<img src="https://raw.githubusercontent.com/williamhqs/GSAnalysis/master/Example/screenshot.png" style="width: 50%; height:50%" alt="GSAnalysis" title="GSAnalysis">
</p>

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

1. Use it from storyboard
Just drag and drop a UIView to storyboard and change the class to "GSxxxView", that's it.

2. You also can use it as normal UIView

Both way need to provide the dataSources

```ruby
//Add from storyboard
//In viewDidLayoutSubviews method just incase the layout is correct
override func viewDidLayoutSubviews() {
  super.viewDidLayoutSubviews()
  //Add from storyboard
  barChartFromNib.titleLabel.text = "I am from Nib"
  barChartFromNib.points = [5,6,7,9]
}
```

//Add by code
let frame = CGRect(x: barChartFromNib.frame.origin.x, y: barChartFromNib.frame.height + barChartFromNib.frame.origin.y + 50, width: 200, height: 100)
let barChart = GSBarChartView(frame: frame)

barChart.barSpace = 15.0

barChart.barWidth = 50.0

barChart.points = [5,6,7,9]

barChart.barColor1 = UIColor.redColor()
barChart.barColor2 = UIColor.greenColor()
barChart.baseLineColor = UIColor.blueColor()
self.view.addSubview(barChart)
```

```
let lineView = GSLineView(frame: CGRect(x: 50,y: 100,width: 300,height: 300))
lineView.points = [4, 2, 6, 4, 5, 8, 3]
lineView.startColor = UIColor(red: 250/255.0, green: 233/255.0, blue: 222/255.0, alpha: 1.0)
lineView.endColor = UIColor(red: 252/255.0, green: 79/255.0, blue: 8/255.0, alpha: 1.0)
self.view.addSubview(lineView)
```

## Requirements
IOS 8 and later.
## Installation

GSAnalysis is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GSAnalysis"
```

## Author

William Hu, william.hqs@gmail.com

## License

GSAnalysis is available under the MIT license. See the LICENSE file for more info.
