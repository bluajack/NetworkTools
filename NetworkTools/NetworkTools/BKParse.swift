//
//  BKParse.swift
//  面向协议编程封装
//
//  Created by 数文科技 on 2017/4/14.
//  Copyright © 2017年 bluajack. All rights reserved.
//

import Foundation

extension Data {
    func json() -> Any?{
        if let json = try? JSONSerialization.jsonObject(with: self, options: .allowFragments) {
            return json
        }else {
            return nil
        }
    }
}
