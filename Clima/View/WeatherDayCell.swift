//
//  WeatherDayCell.swift
//  Clima
//
//  Created by Yerkebulan Serikov on 11.02.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

class WeatherDayCell: UIView {

    
    init(d: String, w: String, nT: Int, dT: Int) {
        super.init(frame: .zero)
        self.contentMode = .scaleAspectFit
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.contentMode = .scaleAspectFit
        stackView.spacing = 40
        let la = UILabel()
        la.text = d
        la.font = UIFont.systemFont(ofSize: 20.0)
        let nightTemp = UILabel()
        nightTemp.text = "\(nT)°"
        nightTemp.font = UIFont.systemFont(ofSize: 30.0)
        let dayTemp = UILabel()
        dayTemp.text = "\(dT)°"
        dayTemp.font = UIFont.systemFont(ofSize: 30.0)
        stackView.addArrangedSubview(la)
        
        let image = UIImage(systemName: w)
        image?.withTintColor(.black)
        if let safeImage = image {
            let viewImage = UIImageView(image: safeImage)
            viewImage.frame(forAlignmentRect:  CGRect(x: 0, y: 0, width: 89.5, height: 89.5))
            viewImage.contentMode = .scaleAspectFit
            stackView.addArrangedSubview(viewImage)
        }
        stackView.addArrangedSubview(nightTemp)
        stackView.addArrangedSubview(dayTemp)
        self.addSubview(stackView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    
}
