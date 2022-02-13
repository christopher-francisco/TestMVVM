//
//  NotYetStartedView.swift
//  MVVMTest
//
//  Created by Christopher Francisco on 13/02/2022.
//

import SwiftUI

struct NotYetStartedView: View {
  @StateObject var viewModel: NotYetStartedViewModel
  
  var body: some View {
    VStack(spacing: 8) {
      Text("Not yet started")
      
      Button(action: viewModel.start) {
        Text("Start")
      }
    }
  }
}

struct NotYetStartedView_Previews: PreviewProvider {
  static var timer = Timer()
  
  static var previews: some View {
    NotYetStartedView(
      viewModel: .init(
        timer: .constant(timer),
        store: Store(),
        nManager: NotificationManager(),
        wManager: WatchConnectionManager()
      )
    )
  }
}
