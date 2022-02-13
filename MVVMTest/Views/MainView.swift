//
//  ContentView.swift
//  MVVMTest
//
//  Created by Christopher Francisco on 13/02/2022.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel: MainViewModel
  
  var body: some View {
    VStack {
      Text("Timer")
      Text("some subtitle")
      
      if viewModel.timer.started {
        StartedView(viewModel: viewModel.makeStartedViewModel())
          .padding()
      } else {
        NotYetStartedView(viewModel: viewModel.makeNotYetStartedViewModel())
          .padding()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  
  // I usually pass stub of these instead of the real
  // ones, so that designing is easier
  static var factory = Factory(
    store: Store(),
    nManager: NotificationManager(),
    wManager: WatchConnectionManager()
  )
  
  static var previews: some View {
    MainView(viewModel: factory.makeMainViewModel())
  }
}
