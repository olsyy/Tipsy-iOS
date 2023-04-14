import Foundation

struct BillCalculator {
    var prc: Float = 0.0
    var split = 2
    var billValue: String?
    var totalValue: Float = 0.0
    
    mutating func calculatePrc(_ title: String) {
        prc = Float(title.dropLast())!/100.0
    }
    
    mutating func calculateTotal() {
        if billValue != nil {
            totalValue = Float(billValue!)! * (prc + 1) / Float(split)
        }
    }
    
    func getTotal() -> String {
        return String(format: "%.2f", totalValue)
    }
    func getSplit() -> String {
        return String(split)
    }
    
    func getPercentage() -> String {
        return String(format: "%.0f", prc * 100) + "%"
    }
    
}
