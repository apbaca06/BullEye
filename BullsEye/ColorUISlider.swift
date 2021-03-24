//
//  ColorUISlider.swift
//  BullsEye
//
//  Created by  cindy on 2021/3/24.
//

import Foundation
import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    
    class Coordinator: NSObject {
        
        var value: Binding<Double>
        var alpha: Binding<Double>
        
        init(value: Binding<Double>, alpha: Binding<Double>) {
            self.value = value
            self.alpha = alpha
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value.wrappedValue = Double(sender.value)
            alpha.wrappedValue = Double(sender.alpha)
        }
    }
    
    var color: UIColor
    @Binding var value: Double
    @Binding var alpha: Double
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, alpha: $alpha)
    }
    
    func makeUIView(context: Self.Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = color.withAlphaComponent(CGFloat(alpha))
        
        slider.value = Float(value)
        // Target is context coordinator
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Self.Context) {
        uiView.value = Float(value)
        uiView.alpha = CGFloat(alpha)
    }

}

struct ColorUISliderPreviews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .blue, value: .constant(50.0), alpha: .constant(0.3))
    }
}
