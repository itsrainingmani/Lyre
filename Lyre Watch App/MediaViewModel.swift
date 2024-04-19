//
//  MediaViewModel.swift
//  Lyre Watch App
//
//  Created by Manikandan Sundararajan on 4/18/24.
//

import Foundation
import MediaPlayer
import SwiftUI

class MediaViewModel: ObservableObject {
    @Published var currentTitle: String = "No media playing"

    init() {
        updateMediaInfo()
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(mediaInfoChanged),
//            name: .MPMusicPlayerControllerNowPlayingItemDidChange,
//            object: nil
//        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func mediaInfoChanged(notification: NSNotification) {
        updateMediaInfo()
    }

    func updateMediaInfo() {
        let nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo
        if let title = nowPlayingInfo?[MPMediaItemPropertyTitle] as? String {
            DispatchQueue.main.async {
                self.currentTitle = title
            }
        } else {
            DispatchQueue.main.async {
                self.currentTitle = "No media playing"
            }
        }
    }
}
