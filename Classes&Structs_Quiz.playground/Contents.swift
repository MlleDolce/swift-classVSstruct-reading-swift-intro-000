//: Playground - noun: a place where people can play

import UIKit

// Classes & Structs quiz

// Question 1:

// Given this class that represents a giant:

        class Giant {
            var name: String
            var weight: Double
            var homePlanet: String
            
            init(name: String, weight: Double, homePlanet: String) {
                self.name = name
                self.weight = weight
                self.homePlanet = homePlanet
            }
        }

        // And this code that instantiates an instance of Giant:
        let fred = Giant(name: "Fred", weight: 340.0, homePlanet: "Earth")

        // Will these three lines of code run? If not, why not?

        fred.name = "Brick"
        fred.weight = 999.2
        //fred.homePlanet = "Mars"

        // Answer: The first two lines of code will run because these properties are set up as variables and can be changed.  The third line of code contains a constant 'let homePlanet' which cannot be changed and will not run as is.  

// Question 2:
        //Once changed to 'var' in the class definition, fred.homePlanet will now run.
        // changed 'let' to 'var' in class:
        fred.homePlanet = "Mars"

// Question 3:

    //Take a look at this struct that represents an alien:

    struct Alien {
        var name: String
        var height: Double
        var homePlanet: String
    }

    //And this line of code that instantiates an Alien:

    //let bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")

    //Will these three lines of code run? If so, why not?

    //    bilbo.name = "Jake"
    //    bilbo.height = 1.42
    //    bilbo.homePlanet = "Saturn"

    // Answer: No, these lines of code will note run as is.  Since bilbo is instantiated as a constant ('let bilbo'), none of bilbo's properties can be changed.

// Question 4:

    // Can you change the declaration of bilbo so that the above three lines of code do work?

    // Answer:
    var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")
    bilbo.name = "Jake"
    bilbo.height = 1.42
    bilbo.homePlanet = "Saturn"

// Question 5:

    //Consider this bit of code that uses the Giant class:

    let edgar = Giant(name: "Edgar", weight: 520.0, homePlanet: "Earth")
    let jason = edgar
    jason.name = "Jason"
    print(edgar.name)
    print(jason.name)

    //What will the value of edgar.name be after those three lines of code are run? What will the value of jason.name be? Why?

    // Answer: edgar.name will now be "Jason".  jason.name will also be "Jason".  This is because a class is a reference type.  When an object is instantiated, it is stored a single time in memory.  Once jason and edgar point to each other, this will remain so even if a property is later changed, thus changing both jason's and edgar's properties.

// Question 6:

    //Given this bit of code that uses the Alien struct:

    var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
    var charlesFromJupiter = charles
    charlesFromJupiter.homePlanet = "Jupiter"
    print(charles.homePlanet)
    print(charlesFromJupiter.homePlanet)

    //What will the value of charles.homePlanet be after the above code run? What about the value of charlesFromJupiter.homePlanet? Why?

    // Answer: The value of charles.homePlanet will remain "Pluto", as it was intantiated.  The value of charlesFromJupiter.homePlanet will be altered to "Jupiter."  This is because a struct is a value type.  When properties are set for a struct, they point to different copies of the struct.  Thus, when charlesFromJupiter is set to equal charles, it only points to a copy of charles.  This way, either property can be changed independent of one other at a later point.

// Question 7:

    // Here's a struct that represents a bank account:

    //    struct BankAccount {
    //        var owner: String
    //        var balance: Double
    //        
    //        func deposit(_ amount: Double) {
    //            balance += amount
    //        }
    //        
    //        func withdraw(_ amount: Double) {
    //            balance -= amount
    //        }
    //    }

    // Does this code work? Why or why not?

    // Answer: Not as is.  BankAccount's methods 'deposit' and 'withdraw' both need to be changed to 'mutating'.  As they are written, the methods are void and will not change the value of the property balance.  This is because the method is trying to change a copy of the struct.  To be able to change a property of struct, a method must be altered to include the keyword 'mutating'.

// Question 8:

    // Can you fix the BankAccount struct so it does work?

    struct BankAccount {
        var owner: String
        var balance: Double
        
        mutating func deposit(_ amount: Double) {
            balance += amount
        }
        
        mutating func withdraw(_ amount: Double) {
            balance -= amount
        }
    }

// Question 9:

    // Given this bit of code (which incorporates any fixes you made in Question 8):

    var joeAccount = BankAccount(owner: "Joe", balance: 100.0)
    var joeOtherAccount = joeAccount
    joeAccount.withdraw(50.0)

    // What will the value of joeAccount.balance be after the above code runs? What about the value of joeOtherAccount.balance? Why?
    print("Joe's bank account has $\(joeAccount.balance)")
    print("Joe's other account has $\(joeOtherAccount.balance)")

    // Answer:
    // joeAccount.balance will be $50 ($100 - $50).  
    // joeOtherAccount.balance will remain $100, since joeOtherAccount is set to equal a copy of joeAccount

// Question 10:

    // Here's a class that can track songs in a music library:

    class MusicLibrary {
        var tracks: [String]
        
        init() {
            tracks = []
        }
        
        func add(track: String) {
            tracks.append(track)
        }
    }

    // Given this bit of code that uses MusicLibrary:

    let library1 = MusicLibrary()
    library1.add(track: "Michelle")
    library1.add(track: "Voodoo Child")
    let library2 = library1
    library2.add(track: "Come As You Are")

    // After this code runs, what are the contents of library1.tracks? What about the contents of library2.tracks? Why?

    print(library1.tracks)
    print(library2.tracks)

    // Answer:
    // After the code runs, the contents of library1.tracks and library2.tracks are exactly the same: ["Michelle", "Voodoo Child", "Come As You Are"].  This is because library2 and library1 point to each other with 'let libary2 = library1'.  If the property of one changes, so must the other.






