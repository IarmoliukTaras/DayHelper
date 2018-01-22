//
//  Note.swift
//  DayHelper
//
//  Created by 123 on 21.01.2018.
//  Copyright © 2018 TarasSoft. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Note: Object {
    
    dynamic var text: String = ""
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
}
