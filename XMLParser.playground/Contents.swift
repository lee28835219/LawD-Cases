import Foundation

// XMLParserDelegate를 구현한 클래스를 만듭니다.
class XMLParserDelegate: NSObject, Foundation.XMLParserDelegate {
    var isParsing = false
    var currentElement = ""
    var parsedText = ""

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        if elementName == "판결요지" {
            isParsing = true
            parsedText = ""
        }
        currentElement = elementName
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if isParsing {
            parsedText += string
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "판결요지" {
            isParsing = false
            // HTML <br> 태그를 줄바꿈 문자로 대체
            let formattedText = parsedText.replacingOccurrences(of: "<br/>", with: "\n")
            print("[판결요지]\n \(formattedText)")
        }
    }
}

if let url = URL(string: "https://www.law.go.kr/DRF/lawService.do?OC=lee28835219&target=prec&ID=228541&type=XML") {
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            print("HTTP Error: \(httpResponse.statusCode)")
            return
        }

        if let data = data {
            let parser = XMLParser(data: data)
            let delegate = XMLParserDelegate()
            parser.delegate = delegate
            if parser.parse() {
                // 파싱이 성공적으로 완료되었습니다.
                // <판시사항> 내용은 delegate의 parser(_:didEndElement:namespaceURI:qualifiedName:)에서 출력됩니다.
            }
        }
    }
    task.resume()
} else {
    print("Invalid URL")
}
