import Foundation

// I.​ Add arithmetic operators (add, subtract, multiply, divide) to make the following expressions true

let result =  ((3 + 1) / 3.0) * 9


// II.​ ​Write a function/method utilizing Swift to determine whether two strings are anagrams or not
func checkAnagram(_ first: String, _ second: String)->Bool{
    var firstSet = Set<Character>()
    var secondSet = Set<Character>()
    first.replacingOccurrences(of: " ", with: "").forEach{firstSet.insert($0)}
    second.replacingOccurrences(of: " ", with: "").forEach{secondSet.insert($0)}
    return firstSet == secondSet
}

checkAnagram("debit card", "bad credit")
checkAnagram("punishments", "nine thumps")


//III.​ ​Write a method in Swift to generate the nth Fibonacci number (1, 1, 2, 3, 5, 8, 13, 21, 34)


func FibonacciIterative(n: Int)->Int{
    guard n > 1 else {return n}
    
    var first = 0
    var second = 1
    
    var result = [second]  // as array starts with 1 as example in assessment.
    
    for _ in 1..<n {
        let newVal = first + second
        first = second
        second = newVal
        result.append(newVal)
    }
    print(result)
    return second
}

FibonacciIterative(n: 5)


func FibRecursive (n: Int) -> Int {
    guard n > 1 else {return n}
    return FibRecursive(n: n - 1) + FibRecursive(n: n - 2)
}

FibRecursive(n: 6)

/*
 =================================     ====================================

 IV. Which architecture would you use for the required task below? Why?

 I will use MVVM, because it will be easy to bind the viewModel to the view and reflect the ui due to the data state
 
 */

/*
 ==================================    ====================================
 
 V. Create a currency converter by utilizing data from the fixer.io API.
 
 the XCode project is next by this file
 */
