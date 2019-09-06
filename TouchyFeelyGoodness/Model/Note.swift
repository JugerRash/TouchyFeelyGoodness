//
//  NOte.swift
//  TouchyFeelyGoodness
//
//  Created by juger rash on 06.09.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import Foundation

class Note {
    public private(set) var message : String
    public var status : LockStatus
    
    init(message : String , status : LockStatus) {
        self.message = message
        self.status = status
    }
}
