//
//  Protocols.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 23.06.2021.
//

import UIKit

struct ZoomTransitionManager {
    var cardView : UIView
    var cardViewFrame: CGRect
}

protocol DetailRatingDelegate: AnyObject {
    func didGoBack()
}
