for i in 0...100{
    if i % 3 == 0 && i % 5 == 0{
        print("FizzBuzz")
    }else if i % 3 == 0{
        print("Fizz")
    }else if i % 5 == 0{
        print("Buzz")
    }else {print(i)}
}

func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

for i in 0...100{
    if(isPrime(i)){
        print(i);
    }
}

print("Enter the temperature value")
if let read = readLine(), let num = Int(read) {
    print("Enter the initial unit of the value (C, K, or F)")
    if let unit = readLine() {
        if unit == "C" {
            let one = Double(num) * 1.8 + 32
            let two = Double(num) + 273.15
            print("Fahrenheit = \(one), Kelvin = \(two)")
        } else if unit == "K" {
            let one = Double(num) - 273.15
            let two = one * 1.8 + 32
            print("Celsius = \(one), Fahrenheit = \(two)")
        } else if unit == "F" {
            let one = (Double(num) - 32) / 1.8
            let two = one + 273.15
            print("Celsius = \(one), Kelvin = \(two)")
        } else {
            print("Invalid unit entered. Please enter 'C', 'K', or 'F'.")
        }
    }
} else {
    print("Invalid temperature value entered.")
}

var shoppingList: [String] = []

func displayMenu() {
    print("\nShopping List Application")
    print("1. Add item")
    print("2. Remove item")
    print("3. Display list")
    print("4. Exit")
    print("Enter your choice (1-4):", terminator: " ")
}

func addItem() {
    print("Enter the item to add:", terminator: " ")
    if let item = readLine(), !item.isEmpty {
        shoppingList.append(item)
        print("'\(item)' added to the shopping list.")
    } else {
        print("Invalid input. Please try again.")
    }
}

func removeItem() {
    print("Enter the item to remove:", terminator: " ")
    if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
        shoppingList.remove(at: index)
        print("'\(item)' removed from the shopping list.")
    } else {
        print("Item not found in the shopping list.")
    }
}

func displayList() {
    if shoppingList.isEmpty {
        print("The shopping list is empty.")
    } else {
        print("\nShopping List:")
        for (index, item) in shoppingList.enumerated() {
            print("\(index + 1). \(item)")
        }
    }
}


var isRunning = true

while isRunning {
    displayMenu()
    
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            addItem()
        case 2:
            removeItem()
        case 3:
            displayList()
        case 4:
            isRunning = false
            print("Exiting the application. Goodbye!")
        default:
            print("Invalid option. Please choose a number between 1 and 4.")
        }
    } else {
        print("Invalid input. Please enter a valid number.")
    }
}

func wordFrequencyCounter() {
    // Prompt the user to enter a sentence
    print("Enter a sentence:")
    if let sentence = readLine() {
        
        // Convert to lowercase
        let lowercaseSentence = sentence.lowercased()
        
        // Remove punctuation manually by filtering out non-alphabetic characters
        let cleanedSentence = lowercaseSentence.filter { $0.isLetter || $0.isWhitespace }
        
        // Split the sentence into words based on spaces
        let words = cleanedSentence.split(separator: " ").map { String($0) }
        
        // Dictionary to store word-frequency pairs
        var wordFrequency: [String: Int] = [:]
        
        // Count the frequency of each word
        for word in words {
            wordFrequency[word, default: 0] += 1
        }
        
        // Display the words and their frequencies
        print("\nWord Frequencies:")
        for (word, count) in wordFrequency {
            print("\(word): \(count)")
        }
    }
}


wordFrequencyCounter()




func fibonacci(_ n: Int) -> [Int] {
    // Handle cases where n is less than or equal to zero
    if n <= 0 {
        return []
    }
    
    // Start with the first two Fibonacci numbers
    var sequence = [0, 1]
    
    // If n is 1, only return the first number
    if n == 1 {
        return [0]
    }
    
    // Use a loop to generate the rest of the sequence up to n numbers
    for i in 2..<n {
        let nextNumber = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextNumber)
    }
    
    // Return the first n Fibonacci numbers
    return sequence
}


let result = fibonacci(10)
print(result)  // Output: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

func processStudentScores() {
    var studentScores: [String: Int] = [:]
    var totalScore = 0
    
    // Accept student names and scores
    print("Enter the number of students:")
    if let numStudents = Int(readLine()!) {
        for _ in 1...numStudents {
            print("Enter the student's name:")
            let name = readLine()!
            
            print("Enter the score for \(name):")
            if let score = Int(readLine()!) {
                studentScores[name] = score
                totalScore += score
            } else {
                print("Invalid score. Please enter a valid integer.")
            }
        }
        
        // Calculate the average score
        let averageScore = Double(totalScore) / Double(studentScores.count)
        
        // Determine the highest and lowest scores
        let highestScore = studentScores.values.max() ?? 0
        let lowestScore = studentScores.values.min() ?? 0
        
        // Display the result for each student
        print("\nStudent Results:")
        for (name, score) in studentScores {
            let comparison = score >= Int(averageScore) ? "above" : "below"
            print("\(name): Score = \(score) (\(comparison) average)")
        }
        
        // Display the average, highest, and lowest scores
        print("\nSummary:")
        print("Average Score: \(averageScore)")
        print("Highest Score: \(highestScore)")
        print("Lowest Score: \(lowestScore)")
        
    } else {
        print("Invalid number of students.")
    }
}


processStudentScores()


func isPalindrome(_ text: String) -> Bool {
    // Remove spaces and punctuation, and convert to lowercase
    let cleanedText = text.lowercased().filter { $0.isLetter }
    
    // Compare the cleaned text with its reverse
    return cleanedText == String(cleanedText.reversed())
}

let result1 = isPalindrome("A man, a plan, a canal: Panama")
print(result1)  // Output: true

let result2 = isPalindrome("Hello World")
print(result2)  // Output: false



// Function to perform addition
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

// Function to perform subtraction
func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

// Function to perform multiplication
func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

// Function to perform division with error handling
func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        return nil // Return nil if division by zero
    }
    return a / b
}

func startCalculator() {
    var shouldContinue = true
    
    while shouldContinue {
        // Prompt the user to enter two numbers
        print("Enter the first number:")
        guard let firstInput = readLine(), let firstNumber = Double(firstInput) else {
            print("Invalid input. Please enter a valid number.")
            continue
        }
        
        print("Enter the second number:")
        guard let secondInput = readLine(), let secondNumber = Double(secondInput) else {
            print("Invalid input. Please enter a valid number.")
            continue
        }
        
        // Prompt the user to choose an operation
        print("Choose an operation: +, -, *, /")
        guard let operation = readLine() else {
            print("Invalid operation. Please choose a valid operation.")
            continue
        }
        
        var result: Double?
        
        // Perform the selected operation
        switch operation {
        case "+":
            result = add(firstNumber, secondNumber)
        case "-":
            result = subtract(firstNumber, secondNumber)
        case "*":
            result = multiply(firstNumber, secondNumber)
        case "/":
            if let divisionResult = divide(firstNumber, secondNumber) {
                result = divisionResult
            } else {
                print("Error: Division by zero is not allowed.")
                continue
            }
        default:
            print("Invalid operation. Please choose +, -, *, or /.")
            continue
        }
        
        // Display the result
        if let result = result {
            print("The result is: \(result)\n")
        }
        
        // Ask the user if they want to perform another calculation
        print("Do you want to perform another calculation? (yes/no)")
        if let answer = readLine()?.lowercased(), answer != "yes" {
            shouldContinue = false
        }
    }
    
    print("Thank you for using the calculator!")
}


startCalculator()


// Function to check if a string has all unique characters
func hasUniqueCharacters(_ text: String) -> Bool {
    // Set to store encountered characters
    var encounteredCharacters: Set<Character> = []
    
    // Loop through each character in the input string
    for char in text {
        // If the character is already in the set, return false
        if encounteredCharacters.contains(char) {
            return false
        }
        // Otherwise, add the character to the set
        encounteredCharacters.insert(char)
    }
    
    // If no duplicates were found, return true
    return true
}

// Example usage:
let result12 = hasUniqueCharacters("Swift")
print(result12)  // Output: true

let result21 = hasUniqueCharacters("Hello")
print(result21)  // Output: false

