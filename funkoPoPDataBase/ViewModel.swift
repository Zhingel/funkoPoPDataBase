//
//  ViewModel.swift
//  funkoPoPDataBase
//
//  Created by Стас Жингель on 19.10.2021.
//

import Foundation


struct FunkoPop: Identifiable {
    var handle : String = ""
    var title : String = ""
    var imageName : String = ""
    var series : String = ""
    var id = UUID()
    
    
    init(raw: [String]) {
        handle = raw[0]
        title = raw[1]
        imageName = raw[2]
        series = raw[3]
    }
}

func loadCSV(from csvName: String) -> [FunkoPop] {
    var cvsToStruct = [FunkoPop]()
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {return []}
    
    
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return []
    }
    var rows = data.components(separatedBy: "\n")
    let columnCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    for row in rows {
        let cvsColumns = row.components(separatedBy: ",")
        if cvsColumns.count == columnCount {
            let funkoStuct = FunkoPop.init(raw: cvsColumns)
            cvsToStruct.append(funkoStuct)
        }
    }
    return cvsToStruct
}
