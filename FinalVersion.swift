//: Playground - noun: a place where people can play

import UIKit



let stuName = ["jack", "jain", "hana", "john", "steve", "bill"]  //변경 불가한 상수

var jack_stuGrade = ["data_structure": 85, "algorithm": 76, "database": 42, "operating_system": 83]
var jain_stuGrade = ["data_structure": 56, "algorithm": 65, "networking": 68, "database": 46, "operating_system": 83]
var hana_stuGrade = ["data_structure": 86, "algorithm": 64, "database": 87, "operating_system": 96]
var john_stuGrade = ["data_structure": 35, "networking": 45, "database": 78]
var steve_stuGrade = ["algorithm": 56, "networking": 89, "operating_system": 100]
var bill_stuGrade = ["data_structure": 87, "algorithm": 45, "database": 65, "operating_system": 78]

extension Array where Element == Int {
    /// 배열의 총 합계 리턴
    var total: Element {
        return reduce(0, +)
    }
    /// 배열의 평균 리턴
    var average: Double {
        return isEmpty ? 0 : Double(reduce(0, +)) / Double(count)
    }
}

var stuAverage: Double = 0
var stuValue: [Int] = []
var count: Int = 0
func totalAverage(grade: Dictionary<String, Int>) -> Double{
    count = count + 1
    stuValue = [Int](grade.values)
    stuAverage = stuAverage + stuValue.average
    return Double(stuAverage)/Double(count)
}

var strGrade: String = ""
var stuDictionary: Dictionary<String, Any> = [String: Any]()
var stuCompletion: Array<String> = Array<String>()
func finalGrade(grade: Dictionary<String, Int>, name:String){
    stuValue = [Int](grade.values)
    
    if stuValue.average >= 90 && stuValue.average <= 100 {
        strGrade = "A"
    } else if stuValue.average >= 80 && stuValue.average < 90 {
        strGrade = "B"
    } else if stuValue.average >= 70 && stuValue.average < 80 {
        strGrade = "C"
    } else if stuValue.average >= 60 && stuValue.average < 70 {
        strGrade = "D"
    } else {
        strGrade = "F"
    }
    
    if stuValue.average >= 70 {
        stuCompletion.append(name)
    }
    
    stuDictionary[name] = strGrade
}

finalGrade(grade: jack_stuGrade, name: "jack")
finalGrade(grade: jain_stuGrade, name: "jain")
finalGrade(grade: hana_stuGrade, name: "hana")
finalGrade(grade: john_stuGrade, name: "john")
finalGrade(grade: steve_stuGrade, name: "steve")
finalGrade(grade: bill_stuGrade, name: "bill")

totalAverage(grade: jack_stuGrade)
totalAverage(grade: jain_stuGrade)
totalAverage(grade: hana_stuGrade)
totalAverage(grade: john_stuGrade)
totalAverage(grade: steve_stuGrade)
//totalAverage(grade: bill_stuGrade)

print("성적결과표\n")

var roundedString = String(format: "%.2f", totalAverage(grade: bill_stuGrade))
print("전체 평균 : \(roundedString)\n")

var keys = Array(stuDictionary.keys).sorted(by: <)
for values in keys{
    print("\(values)\t : \(stuDictionary[values]!)")
}
print("\n수료생")

var cnt:Int = 0
for stuNm in stuCompletion.sorted(by: <){
    cnt = cnt + 1
    
    print(stuNm, terminator:"")
    if(stuCompletion.count != cnt){
        print(", ", terminator:"")
    }
}
