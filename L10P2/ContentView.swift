import SwiftUI


struct Person: Codable {
    var name: String
    var age: Int
    var money: Double
    var isMale: Bool
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear {
          let iosTeachers = [
            Person(name: "Nicole Tan", age: 15, money: 4.20, isMale: true),
            Person(name: "Tristan Chay", age: 15, money: 6.90, isMale: true),
            Person(name: "Tay Kai Quan", age: 15, money: 120, isMale: false),
            Person(name: "Sairam Suresh", age: 15, money: 0.12, isMale: true)
          ]
          var decodedData = Data()
            
          do {
            let jsonData = try JSONEncoder().encode(iosTeachers)
            let jsonString = String(data: jsonData, encoding: .utf8)
            decodedData = Data(jsonString?.utf8 ?? "".utf8)
            print("JSON String: \(jsonString!)")
          } catch {
            print("An error has occurred while attempting to encode to JSON String")
          }
                        
          do {
            let decodedData = try JSONDecoder().decode(Array<Person>.self, from: decodedData)
            print(decodedData)
          } catch {
            print("An error has occurred while attempting to decode from JSON String")
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

