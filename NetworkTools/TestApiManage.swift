//
//  TestApiManage.swift
//  NetworkTools
//
//  Created by Tinghui Yuan on 2018/1/2.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import Foundation

class ReportRequest: Request {
    
    var requestConfig: RequestConfig
    
    required init(_ config: RequestConfig) {
        
        config.host = "http://www.8000dian.com"
        config.methodName = "report.do"
//        config.dataParseMethod = .GBK
        config.method = .GET
        requestConfig = config
    }
}

class HotMarketRequest: Request {
    var requestConfig: RequestConfig
    required init(_ config: RequestConfig) {
        config.host = "http://114.215.237.58:1080/api"
        config.methodName = "market/stocks"
        config.method = .GET
        requestConfig = config
    }
}

