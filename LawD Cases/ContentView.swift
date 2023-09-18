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
                    //            urlString = "https://www.law.go.kr/DRF/lawService.do?OC=lee28835219&target=prec&ID=228541&type=XML"
                    //            urlString = "https://www.law.go.kr/DRF/lawService.do?OC=lee28835219&target=prec&ID=228541&type=HTML"
                    // 대표 판례 2021도3451 상세내용
                    urlString = "https://www.law.go.kr/DRF/lawService.do?OC=lee28835219&target=prec&ID=228541&type=HTML&mobileYn=Y"
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
