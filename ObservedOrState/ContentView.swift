//
//  ContentView.swift
//  ObservedOrState
//
//  Created by Vina Melody on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        HStack {
            VStack {
                Text(verbatim: "\(viewModel.leftCount)")
                Button("Left", systemImage: "arrowshape.backward.circle", action: viewModel.leftButtonTapped)
            }
            .padding()
            .background(Color.yellow)

            VStack {
                Text(verbatim: "\(viewModel.rightCount)")
                Button(action: viewModel.rightButtonTapped) {
                    HStack {
                        Text("Right")
                        Image(systemName: "arrowshape.forward.circle")
                    }
                    .foregroundStyle(Color.white)
                }

            }
            .padding()
            .background(Color.green)
        }
        .padding()
    }


}

#Preview {
    ContentView()
}

final class ViewModel: ObservableObject {
    private(set) var leftCount: Int = 0
    private(set) var rightCount: Int = 0

    func leftButtonTapped() {
        leftCount += 1
        objectWillChange.send()
    }

    func rightButtonTapped() {
        rightCount += 1
    }
}
