//
//  HandleView.swift
//  TeamPlusApp
//
//  Created by Ammar AlTahhan on 23/01/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation
import UIKit

class HandleView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: rect.minX+2, y: rect.minY+2))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY-2))
        path.addLine(to: CGPoint(x: rect.maxX-2, y: rect.minY+2))
        
        path.lineWidth = 4
        path.lineCapStyle = .round
        UIColor.darkMain.setStroke()
        
        path.stroke()
        
    }
    
}
