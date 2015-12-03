//
//  ViewController.swift
//  SherryWeather
//
//  Created by 王卓 on 15/11/23.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let url = NSURL(string: "http://apis.baidu.com/heweather/pro/attractions")!
    let apikey = "06dea2e9c620e7b3c23bac0fb7bdc5c5"
    let cityid = "CN10101010018A"
    var dataArray = [simpleWeatherData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherModel.getWeatherDataWithApiKey(url, apiKey: apikey, cityID: cityid) { (data) -> Void in
            self.dataArray = data
            print(self.dataArray)
        }
        print(dataArray)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

