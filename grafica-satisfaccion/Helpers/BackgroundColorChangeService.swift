//
//  BackgroundColorChangeService.swift
//  grafica-satisfaccion
//
//  Created by  Jose  Santiago on 8/25/19.
//  Copyright © 2019  Jose  Santiago. All rights reserved.
//

import Foundation
import FirebaseDatabase


class BackgroundColorService {
    
    // MARK: Variables and Properties
    
    var colors: Colors?
    var ref = Database.database().reference().child("colors")
    
    func loadColors() {
        ref.observe(.value, with: { snapshot in
            if snapshot.exists() {
                var colors: Colors
                colors = Colors(snapshot: snapshot)!
            }
        })
    }
}


