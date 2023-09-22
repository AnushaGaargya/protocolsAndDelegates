protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR(){
        print("The paramedic does chest compressions, 30 per second")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second")
    }
    
    func useStethoscope() {
        print("Listening for heart sounds")
    }
}

//since surgeon is a child class of doctor class, it inherits from doctor and hence automatically adopts the ALS protocol. however, the methods from the parent class can be overridden
class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the beegees")
    }
    
    func useElectricDrill(){
        print("Surgeon Drills")
    }
}

let emergencycallhandler1 = EmergencyCallHandler()
//let paramedic1 = Paramedic(handler: emergencycallhandler1)
let surgeon1 = Surgeon(handler: emergencycallhandler1)

emergencycallhandler1.assessSituation()
emergencycallhandler1.medicalEmergency()
