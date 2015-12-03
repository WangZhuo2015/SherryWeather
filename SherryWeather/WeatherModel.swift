//
//  WeatherModel.swift
//  SherryWeather
//
//  Created by 王卓 on 15/11/26.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import Foundation
import Alamofire
class WeatherModel{
    class func getWeatherDataWithApiKey(url:NSURL,apiKey:String,cityID:String,processData:([simpleWeatherData])->Void){
        var dataArray = [simpleWeatherData]()
        
        Alamofire.request(.GET, url, parameters: ["cityid":cityID], encoding: .URL , headers: ["apikey":apiKey]).responseJSON(){(result) in
            print(result)
            let JSONData = JSON(data: result.data!)
            let cityName = JSONData["HeWeather data service 3.0"][0]["basic"]["cnty"].string
            
            let dailyForecast = JSONData["HeWeather data service 3.0"][0]["daily_forecast"].array
            
            for(var i=0;i<dailyForecast!.count;i++){
                let dayForcast = dailyForecast![i].dictionary!
                let time:String? = dayForcast["date"]!.string
                
                //最高温度
                let hTemp:String? = dayForcast["tmp"]!["max"].string
                //最低温度
                let lTemp:String? = dayForcast["tmp"]!["min"].string
                
                //天气
                let conditionD:String? = dayForcast["cond"]!["txt_d"].string
                let conditionDCode:Int? = dayForcast["cond"]!["code_d"].int
                let conditionN:String? = dayForcast["cond"]!["txt_n"].string
                let conditionNCode:Int? = dayForcast["cond"]!["code_n"].int
                
                //风向
                let windDirection:String? = dayForcast["wind"]!["dir"].string
                let windForce:String? = dayForcast["wind"]!["sc"].string
                

                let tempData = simpleWeatherData(cityName: cityName, time: time, hTemp: hTemp, lTemp: lTemp, conditionD: conditionD, conditionDCode: conditionDCode, conditionN: conditionN, conditionNCode: conditionNCode, windDirection: windDirection, windForce: windForce)
                dataArray.append(tempData)
            }
            processData(dataArray)
        }
    }
    //函数结束




}

struct simpleWeatherData{
    //城市名
    let cityName:String?
    //时间
    let time:String?
    
    //最高温度
    let hTemp:String?
    //最低温度
    let lTemp:String?
    
    //天气
    let conditionD:String?
    let conditionDCode:Int?
    let conditionN:String?
    let conditionNCode:Int?
    
    //风向
    let windDirection:String?
    let windForce:String?
    
    //湿度
    //let humidity:String?
    //
        
    }