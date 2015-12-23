
# GSAnalysis

[![CI Status](http://img.shields.io/travis/William Hu/GSAnalysis.svg?style=flat)](https://travis-ci.org/William Hu/GSAnalysis)
[![Version](https://img.shields.io/cocoapods/v/GSAnalysis.svg?style=flat)](http://cocoapods.org/pods/GSAnalysis)
[![License](https://img.shields.io/cocoapods/l/GSAnalysis.svg?style=flat)](http://cocoapods.org/pods/GSAnalysis)
[![Platform](https://img.shields.io/cocoapods/p/GSAnalysis.svg?style=flat)](http://cocoapods.org/pods/GSAnalysis)

## Screen Shot

<p align="center" >
<img src="https://raw.githubusercontent.com/williamhqs/GSAnalysis/master/Example/screenshot.png" style="width= 320px; height:640px" alt="GSAnalysis" title="GSAnalysis">
</p>


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

1. Use it from storyboard
Just drag and drop a UIView to storyboard and change the class to "GSxxxView", that's it.

2. You also can use it as normal UIView

Both way need to provide the dataSources

```ruby
//Add from storyboard
barChartFromNib.titleLabel.text = "I am from Nib"
barChartFromNib.points = [(0,0,100),(0,10,100)]

//Add by code
let frame = CGRect(x: barChartFromNib.frame.origin.x, y: barChartFromNib.frame.height + barChartFromNib.frame.origin.y + 50, width: 200, height: 100)
let barChart = GSBarChartView(frame: frame)

barChart.barSpace = 15.0

barChart.barWidth = 50.0

barChart.points = [(0,0,100),(0,10,100)]

barChart.barColor1 = UIColor.redColor()
barChart.barColor2 = UIColor.greenColor()
barChart.baseLineColor = UIColor.blueColor()
self.view.addSubview(barChart)
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
