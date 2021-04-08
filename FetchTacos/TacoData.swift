//
//  TacoData.swift
//  FetchTacos
//
//  Created by Austreberto Gomez on 4/8/21.
//

import SwiftUI

struct TacoData: Decodable {
    var baseLayer: BaseLayerData
    var seasoning: SeasoningData
    
    enum CodingKeys: String, CodingKey {
        case baseLayer = "base_layer"
        case seasoning
    }
}

struct BaseLayerData: Decodable {
    var name: String
}

struct SeasoningData: Decodable {
    var name: String
}
