let fruits:[String] = ["apple","banana","orange","dragon fruit", "kiwi"]
print(fruits[2])

var favNum: Set<Int> = [123,2134,64,843]
favNum.insert(333)
print(favNum)

let dic:Dictionary<String, String> = ["c++":"1979", "swift":"1973","python":"1989"]
print(dic["swift"]!)

var colors:[String] = ["red","blue","green","grey"]
colors[1] = "yellow"
print(colors)

var set1:Set<Int> = [1,2,3,4]
var set2:Set<Int> = [3,4,5,6]
print(set1.intersection(set2))

var studScore:Dictionary<String, Int> = ["Amir":3,"Dima":4,"Lera":5]
studScore["Dima"] = 2
print(studScore)

var arr1:Array<String> = ["apple","banana"]
var arr2:Array<String> = ["cherry", "date"]
var arr3:Array<String>
arr3 = arr1 + arr2
print(arr3)

var countries:Dictionary<String, Int> = ["Kazakhstan": 20, "Russia":150, "USA": 300]
countries["Japan"] = 200
print(countries)

var cd:Set<String> = ["cat", "dog"]
var dm:Set<String> = ["dog","mouse"]
var un:Set<String> = cd.union(dm)
print(un.subtracting(dm))

var res:Dictionary<String, Array<Int>> = ["Dima":[2,4,2,3],"Alex":[3,3,4,5]]
let Dima = res["Dima"] ?? []
print(Dima[1])