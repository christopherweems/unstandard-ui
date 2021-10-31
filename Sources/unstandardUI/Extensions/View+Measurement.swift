//
//  View+Measurement.swift
//
//
//  Created by Christopher Weems on 10/18/21.
//

import SwiftUI


// MARK: - View Size

extension View {
    public func measuring(size: Binding<CGSize>) -> some View {
        self.modifier(SizeModifier(measuredSize: size))
    }
    
}

fileprivate struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
}

fileprivate struct SizeModifier: ViewModifier {
    @Binding var measuredSize: CGSize
    
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: SizePreferenceKey.self, value: geometry.size)
            
        }
    }

    func body(content: Content) -> some View {
        content
            .overlay(sizeView)
            .onPreferenceChange(SizePreferenceKey.self) {
                measuredSize = $0
            }
    }
    
}

// MARK: - View Frame

extension View {
    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func measuring(frame: Binding<CGRect>,
                          in coordinateSpace: CoordinateSpace = .local,
                          ignoringSafeAreaInsets: Bool = false) -> some View {
        func measureFrame(geometry: GeometryProxy) {
            DispatchQueue.main.async {
                frame.wrappedValue = geometry.frame(_in: coordinateSpace,
                                                    ignoringSafeAreaInsets: ignoringSafeAreaInsets)
            }
        }
        
        return self.background {
            GeometryReader { geometry in
                Color.clear
                    .onAppear { measureFrame(geometry: geometry) }
                    .onChange(of: geometry.nonInsetSize) { _ in measureFrame(geometry: geometry) }
            }
        }
    }
    
}


// MARK: - Window Size

#if os(iOS) || os(tvOS)

extension View {
    public func measuring(windowSize: Binding<CGSize?>) -> some View {
        self.background(WindowMeasurementView(measuredSize: windowSize))
    }
    
}

fileprivate struct WindowMeasurementView: UIViewRepresentable {
    @Binding var measuredSize: CGSize?
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.backgroundColor = .clear
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            measuredSize = uiView.window?.bounds.size
        }
    }
    
}

#endif
