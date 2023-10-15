import UIKit

protocol CargoManaging {
    func addCargo(_ item: String)
    func removeCargo(_ item: String)
    func listCargo()
}

protocol CrewManaging {
    func addCrew(_ member: String)
    func removeCrew(_ member: String)
    func listCrew()
}

class CargoManager: CargoManaging {
    private var cargo: [String] = []

    func addCargo(_ item: String) {
        cargo.append(item)
    }

    func removeCargo(_ item: String) {
        if let index = cargo.firstIndex(of: item) {
            cargo.remove(at: index)
        }
    }

    func listCargo() {
        print("Cargo: \(cargo.joined(separator: ", "))")
    }
}

class CrewManager: CrewManaging {
    private var crew: [String] = []

    func addCrew(_ member: String) {
        crew.append(member)
    }

    func removeCrew(_ member: String) {
        if let index = crew.firstIndex(of: member) {
            crew.remove(at: index)
        }
    }

    func listCrew() {
        print("Crew: \(crew.joined(separator: ", "))")
    }
}

class PirateShip {
    let name: String
    let cannonsCount: Int
    private var cargoManager: CargoManaging
    private var crewManager: CrewManaging

    init(name: String, cannonsCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = cargoManager
        self.crewManager = crewManager
    }

    func addCargo(_ item: String) {
        cargoManager.addCargo(item)
    }

    func removeCargo(_ item: String) {
        cargoManager.removeCargo(item)
    }

    func listCargo() {
        cargoManager.listCargo()
    }

    func addCrew(_ member: String) {
        crewManager.addCrew(member)
    }

    func removeCrew(_ member: String) {
        crewManager.removeCrew(member)
    }

    func listCrew() {
        crewManager.listCrew()
    }

    func fireCannons() {
    }
}

protocol CannonAction {
    func cannonCount() -> Int
    func fireCannon(count: Int)
}

class PirateShipCannonAction: CannonAction {
    private var cannons: Int

    init(cannons: Int) {
        self.cannons = cannons
    }

    func cannonCount() -> Int {
        return cannons
    }

    func fireCannon(count: Int) {
        if cannons >= count {
            cannons -= count
            print("Fired \(count) cannon(s)!")
        } else {
            print("Not enough cannons!")
        }
    }
}

class Frigate: PirateShip {
    private var cannonAction: CannonAction

    init(name: String, cannonCount: Int, cannonAction: CannonAction, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.cannonAction = cannonAction
        super.init(name: name, cannonsCount: cannonCount, cargoManager: cargoManager, crewManager: crewManager)
    }

    override func fireCannons() {
        cannonAction.fireCannon(count: 3)
    }
}

class Galleon: PirateShip {
    private var cannonAction: CannonAction

    init(name: String, cannonCount: Int, cannonAction: CannonAction, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.cannonAction = cannonAction
        super.init(name: name, cannonsCount: cannonCount, cargoManager: cargoManager, crewManager: crewManager)
    }

    override func fireCannons() {
        cannonAction.fireCannon(count: 5)
    }
}

protocol Cannons {
    func cannonCount() -> Int
    func fireCannon(count: Int)
}

class PirateShipWithCannons: PirateShip, Cannons {
    private var cannonAction: CannonAction

    init(name: String, cannonCount: Int, cannonAction: CannonAction, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.cannonAction = cannonAction
        super.init(name: name, cannonsCount: cannonCount, cargoManager: cargoManager, crewManager: crewManager)
    }

    func cannonCount() -> Int {
        return cannonAction.cannonCount()
    }

    func fireCannon(count: Int) {
        cannonAction.fireCannon(count: count)
    }
}

class PirateShipWithProtocolManagers: PirateShipWithCannons {
    private var cargoManager: CargoManaging
    private var crewManager: CrewManaging

    init(name: String, cannonCount: Int, cannonAction: CannonAction, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.cargoManager = cargoManager
        self.crewManager = crewManager
        super.init(name: name, cannonCount: cannonCount, cannonAction: cannonAction, cargoManager: cargoManager, crewManager: crewManager)
    }
}

class TreasureMap {
    private var x: Int
    private var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    func hintToTreasure() -> String {
        if x == 42 && y == 24 {
            return "You're close to the treasure!"
        } else {
            return "Try another location."
        }
    }
}

class SeaAdventure {
    private let adventureType: String

    init(adventureType: String) {
        self.adventureType = adventureType
    }

    func encounter() {
        print("You encountered a \(adventureType) adventure.")
    }
}

let treasureMap = TreasureMap(x: 42, y: 24)
let hint = treasureMap.hintToTreasure()
print(hint)

let pirateCode = PirateCode()
pirateCode.parley()
pirateCode.mutiny()

let adventure = SeaAdventure(adventureType: "Shipwreck")
adventure.encounter()

