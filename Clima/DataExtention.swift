//
//  DataExtention.swift
//  Clima
//
//  Created by Yerkebulan Serikov on 12.02.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}

