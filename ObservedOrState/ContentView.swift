//
//  ContentView.swift
//  ObservedOrState
//
//  Created by Vina Melody on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var isOn: Bool = true

    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: $isOn) {
                    Text(isOn ? "ON" : "OFF")
                }
                .padding()
            }
            .frame(width: 130)

            ChildView()
        }
    }
}

struct ChildView: View {
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
    @Published private(set) var leftCount: Int = 0
    @Published private(set) var rightCount: Int = 0

    func leftButtonTapped() {
        leftCount += 1
    }

    func rightButtonTapped() {
        rightCount += 1
    }
}
