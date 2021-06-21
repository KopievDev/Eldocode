//
//  SaleTimer.swift
//  Eldocode
//
//  Created by Ivan Kopiev on 21.06.2021.
//

import Foundation

class SaleTimer {
    static let shared: SaleTimer = SaleTimer()
    private init() {}
    
    var seconds: Int = 0
    var minuts: Int = 0
    var timerIsActive: Bool = false
    var timer = Timer()
    
    public func timer(on: Bool) {
        if on {
            timerIsActive = on
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.seconds += 1
                print("\(self.minuts):\(self.seconds)")
                if self.seconds == 60 {
                    self.minuts += 1
                    self.seconds = 0
                }
            }
        }else {
            timerIsActive = on
            timer.invalidate()
            minuts = 0
            seconds = 0
        }
    }
}
