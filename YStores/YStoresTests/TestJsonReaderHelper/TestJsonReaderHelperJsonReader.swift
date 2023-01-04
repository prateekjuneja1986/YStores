//
//  JsonReader.swift
//  YStores
//
//  Created by Prateek Juneja on 23/12/22.
//

import Foundation

class TestJsonReaderHelper {
    static func readJSONFrom(fileName: String) -> Any? {
        var json: Any?
        if let path = Bundle(for: TestJsonReaderHelper.self).path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                print("parse error: \(error.localizedDescription)")
            }
        }
        return json
    }
}
