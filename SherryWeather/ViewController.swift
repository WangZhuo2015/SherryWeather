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
    let apikey = ""
    let cityid = "CN10101010018A"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataArray = WeatherModel.getWeatherDataWithApiKey(url, apiKey: apikey, cityID: cityid)
        print(dataArray)
//        Alamofire.request(.GET, url, parameters: ["cityid":cityid], encoding: .URL , headers: ["apikey":apikey]).responseJSON(){(result) in
//            let JSONData = JSON(data: result.data!)
//            print(JSONData)
//            let weather = JSONData["HeWeather data service 3.0"][0]["basic"]["cnty"].string
//            print(weather!)
//            
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

