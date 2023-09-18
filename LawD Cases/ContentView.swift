//
//  ContentView.swift
//  LawD-Cases
//
//  Created by Masterbuilder on 2023/09/18.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var urlString = "https://law.go.kr/판례/(2021도3451)"
        
    var body: some View {
        VStack {
            Text("[판례] \(urlString)")
                .font(.headline)
            WebView(urlString: $urlString)
                .onAppear() {
                    // 판례 리스트
                    urlString = "https://www.law.go.kr/DRF/lawSearch.do?query=*&target=prec&OC=lee28835219&search=1&display=1000&nw=3&page=1&refAdr=law.go.kr&popYn=N&curt=청주지방법원&type=XML"
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
