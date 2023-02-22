//
//  photoInfo.swift
//  DokoDoko
//
//  Created by 瀬川太朗 on 2023/02/22.
//

import Foundation
import CoreLocation

class PhotoInfo: Object {
    
    @objc dynamic var latitude:CLLocationDegrees = 0.0
    @objc dynamic var longtitude:CLLocationDegrees = 0.0
    @objc dynamic var createdAt:String?
    @objc dynamic var imageFileName: String?
}
