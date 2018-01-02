//
//  ViewController.swift
//  NetworkTools
//
//  Created by Tinghui Yuan on 2018/1/2.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    //MARK:- 跑马灯播报
    lazy var reportRequest: ReportRequest = {
        let config = RequestConfig(delegate: self)
        let request = ReportRequest(config)
        return request
    }()
    
    //MARK:- 热门股票行情搜索
    lazy var hotMarketRequest: HotMarketRequest = {
        let config = RequestConfig(delegate: self)
        let request = HotMarketRequest(config)
        return request
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.reportRequest.send()
        
        self.hotMarketRequest.requestConfig.parameter = ["codes":"000001"]
        self.hotMarketRequest.send()
    }


}

extension ViewController: requestCallBackDelegate {
    func callBackSuccess(data: Data, request: Request) {
        if request is ReportRequest {
            dealWithReportRequest(data: data, request: request)
        }else if request is HotMarketRequest {
            dealWithHotMarketRequest(data: data, request: request)
        }
    }
    func callBackError(error: Error, request: Request) {
        
    }
    //跑马灯
    func dealWithReportRequest(data: Data, request: Request) {
        guard let json = try? JSON(data: data) else {return}
        let arr = json.arrayValue.flatMap({$0["headlineContent"].string})
        var scrollText = ""
        for str in arr {
            scrollText += (str + "   ")
        }
        printLog(scrollText)
    }
    //热门股票行情
    func dealWithHotMarketRequest(data: Data, request: Request) {
        guard let json = try? JSON(data: data) else {return}
        let tempArr = NSMutableArray()
        if let arr = json.arrayObject as? [[String:Any]] {
            for tempDic in arr {
                tempArr.add(tempDic)
            }
        }
        
        printLog(tempArr)
    }
}
