//
//  File.swift
//  snapChatProject
//
//  Created by JC Dy on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snap {
    
    let whoPosted: String!
    let datePosted: Date!
    let snapImage: UIImage!
    var seen: Bool
    
    init(name: String, pic: UIImage) {
        self.whoPosted = name
        self.datePosted = Date.init()
        self.snapImage = pic
        self.seen = false
    }
    
}

