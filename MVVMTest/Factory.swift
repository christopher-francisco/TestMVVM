//
//  Factory.swift
//  MVVMTest
//
//  Created by Christopher Francisco on 13/02/2022.
//

import Foundation

class Factory {
  let store: Store
  let nManager: NotificationManager
  let wManager: WatchConnectionManager
  
  init(
    store: Store,
    nManager: NotificationManager,
    wManager: WatchConnectionManager
  ) {
    self.store = store
    self.nManager = nManager
    self.wManager = wManager
  }
  
  func makeMainViewModel() -> MainViewModel {
    MainViewModel(
      store: store,
      nManager: nManager,
      wManager: wManager,
      
      makeNotYetStartedViewModel: { [unowned self] timer in NotYetStartedViewModel(
        timer: timer,
        store: self.store,
        nManager: self.nManager,
        wManager: self.wManager
      )},
      makeStartedViewModel: { timer in StartedViewModel(
        timer: timer,
        store: self.store,
        nManager: self.nManager,
        wManager: self.wManager
      )}
    )
  }
}
