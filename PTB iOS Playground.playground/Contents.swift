//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import MyUIPlaygroundFramework

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
let num = 9
//let mon = Pokemon()
//Dex.initializeDex()
//Dex.initializeDex()
ItemDex.initializeItemDex()

let mon = ItemDex.itemDexArray
//let mon
//let mon = Dex.searchDex(searchParam: "bulbasaur")[0]
//dex.initializeDex()
//let DexArray = Dex.dexArray
//dex.initializeDex()
MoveDex.initializeMoveDex()
//let mon2 = Pokemon(num: 1, species: "Bulbasaur", types: ["Grass","Poison"], baseStats: [:], abilities: [""])
Dex.initializeDex()

let movearray = MoveDex.moveDexArray
//print(movearray)
let dex = Dex.init()
dex.dexArray
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
