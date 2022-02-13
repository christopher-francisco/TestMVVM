//
//  ContentViewViewModel.swift
//  MVVMTest
//
//  Created by Christopher Francisco on 13/02/2022.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
  @Published var timer = Timer()
  
  let store: Store
  let nManager: NotificationManager
  let wManager: WatchConnectionManager
  
  private let makeNotYetStartedViewModelClosure: (_ timer: Binding<Timer>) -> NotYetStartedViewModel
  private let makeStartedViewModelClosure: (_ timer: Binding<Timer>) -> StartedViewModel
  
  init(
    store: Store,
    nManager: NotificationManager,
    wManager: WatchConnectionManager,
    
    makeNotYetStartedViewModel: @escaping (_ timer: Binding<Timer>) -> NotYetStartedViewModel,
    makeStartedViewModel: @escaping (_ timer: Binding<Timer>) -> StartedViewModel
  ) {
    self.store = store
    self.nManager = nManager
    self.wManager = wManager
    
    self.makeNotYetStartedViewModelClosure = makeNotYetStartedViewModel
    self.makeStartedViewModelClosure = makeStartedViewModel
  }
  
}

// MARK: - child View Models

extension MainViewModel {
  var boundTimer: Binding<Timer> { Binding(get: { self.timer }, set: { self.timer = $0 })}
  
  func makeNotYetStartedViewModel() -> NotYetStartedViewModel {
    self.makeNotYetStartedViewModelClosure(boundTimer)
  }
  
  func makeStartedViewModel() -> StartedViewModel {
    self.makeStartedViewModelClosure(boundTimer)
  }
}
