//
//  ColorsConstants.swift
//  TeamPlusApp
//
//  Created by Ammar AlTahhan on 19/01/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var darkMain: UIColor {
        return UIColor(named: "DarkMain")!
    }
    class var lightMain: UIColor {
        return UIColor(named: "LightMain")!
    }
    class var secondary: UIColor {
        return UIColor(named: "Secondary")!
    }
    class var backgroundView: UIColor {
        return UIColor(named: "BackgroundView")!
    }
    class var backgroundView_1: UIColor {
        return UIColor(named: "BackgroundView-1")!
    }
    
    class var ourRed: UIColor {
        return UIColor(displayP3Red: 217/255, green: 54/255, blue: 76/255, alpha: 1)
    }
    class var ourGreen: UIColor {
        return UIColor(displayP3Red: 58/255, green: 131/255, blue: 91/255, alpha: 1)
    }
    class var ourYellow: UIColor {
        return UIColor(displayP3Red: 243/255, green: 157/255, blue: 39/255, alpha: 1)
    }
}
