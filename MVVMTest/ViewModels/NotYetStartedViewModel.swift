//
//  NotYetStartedViewModel.swift
//  MVVMTest
//
//  Created by Christopher Francisco on 13/02/2022.
//

import Foundation
import SwiftUI

class NotYetStartedViewModel: ObservableObject {
  @Binding var timer: Timer
  
  let store: Store
  let nManager: NotificationManager
  let wManager: WatchConnectionManager

  init(
    timer: Binding<Timer>,
    store: Store,
    nManager: NotificationManager,
    wManager: WatchConnectionManager
  ) {
    self._timer = timer
    self.store = store
    self.nManager = nManager
    self.wManager = wManager
  }
  
  func start() {
    // I'll make this into a class later on
    timer = Timer(remainingSeconds: timer.remainingSeconds, started: true)
  }
}
