//
//  SVGWebImageView.swift
//  ScoreTracker
//
//  Created by Sahil ChowKekar on 6/24/25.
//

import WebKit
import SwiftUI

struct SVGWebImageView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let html = """
        <html><body style="margin:0;padding:0;">
        <img src="\(url.absoluteString)" style="width:100%;height:100%;" />
        </body></html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }
}
