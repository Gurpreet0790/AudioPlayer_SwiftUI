//
//  BlurEffect.swift
//  AudioPlayer_SwiftUI
//
//  Created by ReetDhillon on 2024-02-13.
//

import Foundation
import SwiftUI

struct BlurEffect: UIViewRepresentable{
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
