//
//  PhotoInfo.swift
//  TravelRecorder
//
//  Created by CAUADC on 2017. 2. 10..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import Foundation
import RealmSwift

class PhotoInfo: Object {
    dynamic var imageData: Data? = nil
    dynamic var text: String? = nil
}