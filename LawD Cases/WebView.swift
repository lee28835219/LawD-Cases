//
//  WebView.swift
//  LawD Cases
//
//  Created by Masterbuilder on 2023/09/18.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encodedUrlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // 여기에 추가적인 WebView의 delegate 메서드를 구현할 수 있습니다.
    }
}
