//
//  ContentView.swift
//  ObservedOrState
//
//  Created by Vina Melody on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var rightCount: Int = 0
    @State var leftCount: Int = 0

    var body: some View {
        HStack {
            VStack {
                Text(verbatim: "\(leftCount)")
                Button("Left", systemImage: "arrowshape.backward.circle", action: leftButtonTapped)
            }
            .padding()
            .background(Color.yellow)

            VStack {
                Text(verbatim: "\(rightCount)")
                Button(action: rightButtonTapped) {
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

    func leftButtonTapped() {
        leftCount += 1
    }

    func rightButtonTapped() {
        rightCount += 1
    }
}

#Preview {
    ContentView()
}
