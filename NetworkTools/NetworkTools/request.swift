//
//  request.swift
//  面向协议编程封装
//
//  Created by 数文科技 on 2017/4/11.
//  Copyright © 2017年 bluajack. All rights reserved.
//

import Foundation

//MARK:- 普通请求
public protocol Request: class {
    var requestConfig: RequestConfig { get }
    init(_ config: RequestConfig)
    func send() //发请求
    func willSend()
}

public extension Request {
    func send() {
        self.willSend()
        URLSessionClient().send(self)
    }
    func willSend() {
        
    }
}

//MARK:- 上传大文件请求
public protocol UploadRequest: Request {}

//MARK:- 下载请求
public protocol DownloadRequest: Request {}

//MARK:- 普通请求回调
public protocol requestCallBackDelegate: class {
    func callBackSuccess(data: Data, request: Request)
    func callBackError(error: Error, request: Request)
}
