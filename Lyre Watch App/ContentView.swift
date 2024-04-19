//
//  ContentView.swift
//  Lyre Watch App
//
//  Created by Manikandan Sundararajan on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mediaViewModel = MediaViewModel()

    var body: some View {
        VStack {
            Text(mediaViewModel.currentTitle)
                .padding()
                .onAppear {
                    mediaViewModel.updateMediaInfo()
                }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(mediaTitle: "Preview Title")
//    }
//}

#Preview {
    ContentView()
}
