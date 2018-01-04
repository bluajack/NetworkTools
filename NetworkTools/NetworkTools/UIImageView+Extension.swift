//
//  UIImageView+Extension.swift
//  NetworkTools
//
//  Created by Tinghui Yuan on 2018/1/4.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit
import Kingfisher

public extension UIImageView {
    public func setImage(_ URLString: String?, _ placeHolderImage: UIImage? = nil) {
        guard let URLString = URLString else { return }
        guard let url = URL(string: URLString) else { return }
        self.kf.setImage(with: url, placeholder: placeHolderImage)
    }
}
