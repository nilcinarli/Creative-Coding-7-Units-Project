import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [Color.red, Color.red, Color.red, Color.red, Color.red, Color.red]
    @State private var deadGuy: Int = 0
    @State private var neyms: [String] = ["", "Nil", "Ahmet", "Tansa", "Kami", "Ceren", "Berk"]
    
    func deathByRoll() -> Int {
        let diceRoll = Int.random(in: 0...5)
        
        colors[diceRoll] = Color.black
        return diceRoll + 1
    }
    
    var body: some View {
        VStack {
            Text("Person who will face the gun: \(deadGuy)")
                .font(.title)
                .padding()
            
            Button("Tap to roll the dice") {
                deadGuy = deathByRoll()
            }
            .font(.title)
            .padding()
            
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                
                ForEach(1...6, id: \.self) { personNumber in
                    let index = personNumber - 1
                    let angle = -Double(index) * .pi / 3.0
                    let radius: CGFloat = 80
                    let x = cos(angle) * radius
                    let y = sin(angle) * radius
                    
                    Circle()
                        .fill(colors[index])
                        .frame(width: 40, height: 40)
                        .offset(x: x, y: y)
                    
                    Text("\(personNumber)-"+neyms[personNumber])
                        .foregroundColor(.white)
                        .font(.system(size: 11))
                        .offset(x: x, y: y)
                }
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 60, height: 60)
                
                Text("Sedat King")
                    .foregroundColor(.white)
                    .font(.system(size: 11))
            }
        }
    }
}

