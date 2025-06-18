//
//  BoardController.swift
//  Wordle
//
//  Created by Mari Batilando on 2/20/23.
//

import Foundation
import UIKit

class BoardController: NSObject,
                       UICollectionViewDataSource,
                       UICollectionViewDelegate,
                       UICollectionViewDelegateFlowLayout {
<<<<<<< HEAD

  // MARK: - Properties
  let numItemsPerRow = 5
  let numRows = 6
  let collectionView: UICollectionView
  let goalWord: [String]

  var numGuesses = 0
  var currRow: Int {
    return numGuesses / numItemsPerRow
  }

  init(collectionView: UICollectionView) {
    self.collectionView = collectionView
    self.goalWord = WordGenerator.generateRandomWord()!.map { String($0) }
    super.init()
    collectionView.delegate = self
    collectionView.dataSource = self
  }

  // MARK: - Public Methods
  func enter(_ string: String) {
    guard numGuesses < numItemsPerRow * numRows else { return }
    let cell = collectionView.cellForItem(at: IndexPath(item: numGuesses, section: 0)) as! LetterCell
    cell.set(letter: string)
    UIView.animate(withDuration: 0.1,
                   delay: 0.0,
                   options: [.autoreverse],
                   animations: {
      // Exercise 7: Change the scale of the cell by 1.05
      // Tip: Use the transform property of the cell. Use transform.scaledBy to modify the scale. This should feel familiar to lab 1.
      // Checkpoint: After finishing this exercise, you should now be able to see that the board animates whenever you enter a new letter! If it's not animating, check your work on this exercise.
      // START YOUR CODE HERE
    cell.transform.scaledBy(x: 1.05, y: 1.05)
      // END YOUR CODE HERE
    }, completion: { finished in
      cell.transform = CGAffineTransformIdentity
    })
    if isFinalGuessInRow() {
      markLettersInRow()
    }
    numGuesses += 1
  }

  func deleteLastCharacter() {
    guard numGuesses > 0 && numGuesses % numItemsPerRow != 0 else { return }
    let cell = collectionView.cellForItem(at: IndexPath(item: numGuesses - 1, section: 0)) as! LetterCell
    numGuesses -= 1
    // Exercise 6: Look at the available LetterCell's methods to clear the letter and set the style to `initial`
    // Tip: Checkout the public methods on LetterCell.swift
    // Checkpoint: After finishing this exercise, you should now be able to tap on the delete keyboard cell and have the last letter deleted on the board! If it's not working, check your work on this exercise and make sure deleteLastCharacter() is called properly in exercise 3.
    // START YOUR CODE HERE
    cell.clearLetter()
    cell.set(style: .initial)
    // END YOUR CODE HERE
  }
=======
    
    // MARK: - Properties
    var numItemsPerRow = 5
    var numRows = 6
    let collectionView: UICollectionView
    var goalWord: [String]
    
    var numTimesGuessed = 0
    var isAlienWordle = false
    var currRow: Int {
        return numTimesGuessed / numItemsPerRow
    }
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        let rawTheme = SettingsManager.shared.settingsDictionary[kWordThemeKey] as! String
        let theme = WordTheme(rawValue: rawTheme)!
        self.goalWord = WordGenerator.generateGoalWord(with: theme)
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Public Methods
    func resetBoard(with settings: [String: Any]) {
        applyNumLettersSettings(with: settings)
        applyNumGuessesSettings(with: settings)
        applyThemeSettings(with: settings)
        applyIsAlienWordleSettings(with: settings)
        numTimesGuessed = 0
        collectionView.reloadData()
    }
    
    // Exercise 5 Pt. 2 (optional): This function only needs to be implemented if you decide to do the optional requirement (see Pt. 1 in ViewController.swift)
    // This function should reset the board with the current settings without changing the goalWord
    // Tip: Take a look at how resetBoard is implemented above. The only difference is that you don't want to change the settings
    func resetBoardWithCurrentSettings() {
        // START YOUR CODE HERE
        // ...
        // END YOUR CODE HERE
    }
    
    // Exercise 1: Implement applyNumLettersSettings to change the number of letters in the goal word
    // Tip 1: Use a breakpoint to inspect or print the `settings` argument
    // Tip 2: There is a constant `kNumLettersKey` in Constants.swift that you can use as the key to grab the value in the dictionary
    // Tip 3: Assign the correct value of the setting to the `numItemsPerRow` property.
    // Tip 4: You will need to cast the value to the correct type
    // Checkpoint: Correctly implementing this should allow you to change the number of letters in the goal word!
    private func applyNumLettersSettings(with settings: [String: Any]) {
        // START YOUR CODE HERE
        if let value = settings[kNumLettersKey] as? Int {
            numItemsPerRow = value
        }
        // END YOUR CODE HERE
    }

    
    // Exercise 2: Implement applyNumGuessesSettings to change the number of rows in the board
    // Tip 1: Use a breakpoint to inspect or print the `settings` argument
    // Tip 2: There is a constant `kNumGuessesKey` in Constants.swift that you can use as the key to grab the value in the dictionary
    // Tip 3: Assign the correct value of the setting to the `numRows` property.
    // Tip 4: You will need to cast the value to the correct type
    // Checkpoint: Correctly implementing this should allow you to change the number of rows in the board!
    private func applyNumGuessesSettings(with settings: [String: Any]) {
        // START YOUR CODE HERE
        
        // Try to extract the number of guesses using the predefined key
        if let value = settings[kNumGuessesKey] as? Int {
            // Assign it to the numRows property
            numRows = value
        }
        
        // END YOUR CODE HERE
    }

    
    
    // Exercise 3: Implement applyThemeSettings to change the goal word according to the theme
    // Tip 1: There is a constant `kWordThemeKey` in Constants.swift that you can use as the key to grab the theme as a String in the dictionary
    // Tip 2: Pass-in the theme to `WordGenerator.generateGoalWord` (see WordGenerator.swift) and assign its result to the `goalWord` defined above
    //  - The value stored in the settings dictionary is a String, but `WordGenerator.generateGoalWord` expects a WordTheme type.
    //    Use the `WordTheme(rawValue:)` initializer to pass-in the string from the dictionary to get the correct type
    // Checkpoint: Correctly implementing this should allow you to change the theme of the goal word! Use breakpoints or print statements
    // to check the before/after value of goalWord and see if it changes to the correct theme
    private func applyThemeSettings(with settings: [String: Any]) {
        // START YOUR CODE HERE

        // Try to extract the theme string from settings
        if let themeString = settings[kWordThemeKey] as? String,
           let theme = WordTheme(rawValue: themeString) {
            // Generate a new goal word using the theme
            goalWord = WordGenerator.generateGoalWord(for: theme)
        }

        // END YOUR CODE HERE
    }

    
    
    
    // Exercise 4: Implement applyIsAlienWordleSettings to change the goal word after each guess
    // Tip 1: There is a constant `kIsAlienWordleKey` in Constants.swift that you can use as the key to grab the value in the dictionary
    // Tip 2: There is a corresponding property located in this file that you should assign the value of the setting to (look at the "Properties" section above).
    // Checkpoint: Correctly implementing this function should change the goal word each time the user inputs an entire row of letters
    private func applyIsAlienWordleSettings(with settings: [String: Any]) {
        // START YOUR CODE HERE
        
        if let isAlien = settings[kIsAlienWordleKey] as? Bool {
            isAlienWordle = isAlien
        }
        
        // END YOUR CODE HERE
    }

>>>>>>> 21c2b03 (Add Part 2 features (e.g., apply settings to board, theme, alien mode))
}
