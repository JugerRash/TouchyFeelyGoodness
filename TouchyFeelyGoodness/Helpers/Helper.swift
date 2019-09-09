//
//  Helper.swift
//  TouchyFeelyGoodness
//
//  Created by juger rash on 09.09.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import Foundation


func isNoteLocked(_ lockStatus : LockStatus) -> Bool {
    if lockStatus == .locked {
        return true
    }else {
        return false
    }
}

func noteStatusFlipper(_ lockStatus : LockStatus) -> LockStatus {
    if lockStatus == .locked {
        return .unLocked
    }else {
        return .locked
    }
}
