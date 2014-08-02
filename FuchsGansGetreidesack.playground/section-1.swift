    // Playground - noun: a place where people can play

import Cocoa

//var ufer1 = ["Getreidesack", "Gans", "Fuchs"]
var ufer1 = ["Gans","Getreidesack","Fuchs"]

struct Boot {
    var dieseits: Bool = true
    var gast = ""
}
var boot = Boot()

var ufer2: Array<String> = []
var kandidat = ""


    
    func bootBeladen(a: String){
        boot.gast = a
    }
    
    func bootZumAnderenUferRudern() {
        println("Das Boot rudert zum anderen Ufer.")
        //Ankunft an Ufer2
        if boot.dieseits && boot.gast != "" {
            if ufer2.isEmpty {
                ufer2 = [boot.gast]
            } else {
                ufer2.append(boot.gast)
            }
        }
        
        //Ankunft an Ufer1
        if !boot.dieseits && boot.gast != "" {
            if ufer1.isEmpty {
                ufer1 = [boot.gast]
            } else {
                ufer1.append(boot.gast)
            }
        }
        
        boot.dieseits = !boot.dieseits
        boot.gast = ""
    }
    
    func kandidatWaehlen() -> String {
        
        var indexToDelete: Int = 0
        //Boot an Ufer1
        if boot.gast == "" && boot.dieseits {
            /* Am Ufer2 befindet sich mindestens 1 Kandidat
            * Daraus folgt, dass sich an Ufer1 nur noch 2 Kandidaten befinden
            * Wieder angekommende Kandidaten "stellen sich hinten an" - .append() -
            * Somit kann man sofort den ersten Kandidaten im Array auswählen
            * Damit ist sicher gestellt, dass ein Kandidat nicht zweimal hintereinander fährt 
            */
            if ufer2.count > 0 {
                    if !(contains(ufer1, "Fuchs") && contains(ufer1, "Gans")) || !(contains(ufer1, "Gans") && contains(ufer1, "Getreidesack")) {
                        boot.gast = ufer1[0]
                        kandidat = boot.gast
                        indexToDelete = 0
                        println("\(kandidat) fährt mit. An Ufer2 befinden sich \(ufer2).")
                    }
            }else{
                //Nur für den ersten Durchgang entscheidend, um den ersten Kandidaten zu wählen
            for i in 0..ufer1.count {
                boot.gast = ufer1[i]
                ufer1[i] = ""
                println(ufer1)
                if (contains(ufer1, "Fuchs") && contains(ufer1, "Gans")) || contains(ufer1, "Gans") && contains(ufer1, "Getreidesack") {
                    ufer1[i] = boot.gast
                }else{
                    ufer1[i] = boot.gast
                    
                    kandidat = boot.gast
                    
                    indexToDelete = i
                    println("\(kandidat) muss mitfahren.")
                }
            }
            }
            
            ufer1.removeAtIndex(indexToDelete)
            println("Es verbleiben am Ufer1: \(ufer1)")
            }
        
        //Boot an Ufer2
        if !boot.dieseits {
            
            if ufer2.count > 1 {
                if (contains(ufer2, "Fuchs") && contains(ufer2, "Gans")) || contains(ufer2, "Gans") && contains(ufer2, "Getreidesack") {
                    kandidat = ufer2[0]
                    println("\(kandidat) muss mit zurückfahren.")
                    ufer2.removeAtIndex(0)
                }else{
                    kandidat = ""
                    println("Boot fährt leer zurück")
                }
            }else{
                kandidat = ""
                println("Nur \(ufer2) bleibt an Ufer2. Keine Gefahr! Boot fährt leer zurück.")
            }
        }

        return kandidat
    }
    
    
    while ufer1.count > 0 && !(contains(ufer2, "Fuchs") && contains(ufer2, "Gans") && contains(ufer2, "Getreidesack")){
            
        bootBeladen(kandidatWaehlen())

        bootZumAnderenUferRudern()
        println("_______________________________________")
        println("Ufer1: \(ufer1)")
        println("Ufer2: \(ufer2)")
    }


