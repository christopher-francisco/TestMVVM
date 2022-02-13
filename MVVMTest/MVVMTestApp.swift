//
//  MVVMTestApp.swift
//  MVVMTest
//
//  Created by Christopher Francisco on 13/02/2022.
//

import SwiftUI

@main
struct MVVMTestApp: App {
  let factory = Factory (
    store: Store(),
    nManager: NotificationManager(),
    wManager: WatchConnectionManager()
  )
  
  var body: some Scene {
    WindowGroup {
      MainView(viewModel: factory.makeMainViewModel())
    }
  }
}
