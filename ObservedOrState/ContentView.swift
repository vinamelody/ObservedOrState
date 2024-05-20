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
        NavigationView {
            VStack {
                HStack {
                    Toggle(isOn: $isOn) {
                        Text(isOn ? "ON" : "OFF")
                    }
                    .padding()
                }
                .frame(width: 130)

                ChildView(title: "Counter 1")

                NavigationLink {
                    ChildView(title: "Counter 2")
                } label: {
                    Text("Show Counter 2")
                }

                Spacer()
            }
            .navigationTitle("Main")
        }
    }
}

struct ChildView: View {
    @StateObject var viewModel = ViewModel()

    let title: String

    var body: some View {
        HStack {
            Text(title)
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
