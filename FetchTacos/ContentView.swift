//
//  ContentView.swift
//  FetchTacos
//
//  Created by Austreberto Gomez on 4/8/21.
//

import SwiftUI


struct ContentView: View {
    @State var data = TacoData(
        baseLayer: BaseLayerData(name: "taco data"),
        seasoning: SeasoningData(name: "seasoning")
    )
    
    func getData(){
        let urlString = "http://taco-randomizer.herokuapp.com/random/"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {
            data, _, error in
            
            DispatchQueue.main.async {
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(TacoData.self, from: data)
                        self.data = decodedData
                    } catch {
                        print("Error!")
                    }
                }
            
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            Button("Get Random Taco name") {
                self.getData()
            }
            Text("\(data.baseLayer.name)")
        }
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
