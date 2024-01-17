//
//  Enumerate.swift
//  TravelTalk
//
//  Created by 김재석 on 1/17/24.
//

import Foundation

// user 정보
enum User: String {
    case hue = "Hue"
    case jack = "Jack"
    case bran = "Bran"
    case den = "Den"
    case user = "나"
    case other_friend = "내옆자리의앞자리에개발잘하는친구"
    case simsim = "심심이"
    
    var profileImage: String {
        switch self {
        default: return rawValue
        }
    }
}
