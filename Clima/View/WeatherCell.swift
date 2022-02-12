//
//  WeatherCell.swift
//  Clima
//
//  Created by Yerkebulan Serikov on 11.02.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

class WeatherCell: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var nightTemp: UILabel!
    
    @IBOutlet weak var dayTemp: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

    /*init(day: String, weather: String, nightT: Int, dayT: Int) {
                dayLabel.text = day
                weatherImage.image = UIImage(systemName: weather)
                nightTemp.text = "\(nightT)"
                dayTemp.text = "\(dayT)"
                super.init()
            }
     */
            

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
