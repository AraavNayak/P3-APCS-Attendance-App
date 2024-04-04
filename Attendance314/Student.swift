//
//  Student.swift
//  Attendance314
//
//  Created by Araav Nayak on 3/27/24.
//

import UIKit

class Student: NSObject {

    var initials: String = ""
    var name: String = ""
    var num: Int = -1
    
    
    init(initials: String, name: String, num: Int) {
        self.initials = initials
        self.name = name
        self.num = num
    }
       
    
}
