//
//  Color.swift
//  grafica-satisfaccion
//
//  Created by  Jose  Santiago on 8/25/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Colors {
    var primaryColor: UIColor
    var secondaryColor: UIColor
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let primaryColor = value["primaryColor"] as? String,
            let secondaryColor = value["secondaryColor"] as? String
        else { return nil }
        
        self.primaryColor = UIColor(hexString: primaryColor)
        self.secondaryColor = UIColor(hexString: secondaryColor)
    }
}


