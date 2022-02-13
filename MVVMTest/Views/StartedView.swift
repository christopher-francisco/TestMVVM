//
//  StartedView.swift
//  MVVMTest
//
//  Created by Christopher Francisco on 13/02/2022.
//

import SwiftUI

struct StartedView: View {
  @StateObject var viewModel: StartedViewModel
  
  let swiftTimer = SwiftUI.Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    VStack(spacing: 8) {
      Text("It's started")
      
      Text("Remaining \(viewModel.timer.remainingSeconds)")
      
      Button(action: viewModel.cancel) {
        Text("Cancel")
      }
    }
    .onReceive(swiftTimer) { _ in
      print("tick")
      
      withAnimation {
        viewModel.tick()
      }
    }
  }
}

struct StartedView_Previews: PreviewProvider {
  static var timer = Timer()
  
  static var previews: some View {
    StartedView(
      viewModel: .init(
        timer: .constant(timer),
        store: Store(),
        nManager: NotificationManager(),
        wManager: WatchConnectionManager()
      )
    )
  }
}
