//
//  SAPFioriProcessingIndicator.swift
//  GoParkingPlease
//
//  Created by Ammar AlTahhan on 09/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import Foundation
import SAPFiori

protocol SAPFioriProcessingIndicator: class {
    var processingIndicator: FUIProcessingIndicatorView? { get set }
}

extension SAPFioriProcessingIndicator where Self: UIViewController {
    func showFioriProcessingIndicator(_ message: String = "") {
        OperationQueue.main.addOperation({
            let indicator = FUIProcessingIndicatorView(frame: self.view.frame)
            indicator.text = message
            self.view.addSubview(indicator)
            indicator.show()
            self.processingIndicator = indicator
        })
    }
    
    func hideFioriLoadingIndicator() {
        OperationQueue.main.addOperation({
            guard let loadingIndicator = self.processingIndicator else {
                return
            }
            loadingIndicator.dismiss()
        })
    }
}
