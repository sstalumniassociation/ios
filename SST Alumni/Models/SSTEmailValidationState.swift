//
//  SSTEmailValidationState.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import Foundation

enum SSTEmailValidationState {
    case invalid
    case student(String, Int)
    case staff(String)
}
