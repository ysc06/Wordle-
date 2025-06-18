//
//  KeyboardController+Extensions.swift
//  Wordle
//
//  Created by Mari Batilando on 3/1/23.
//

import Foundation
import UIKit

extension KeyboardController {
  
<<<<<<< HEAD
  var itemPadding: Double { 8.0 }
  var numRows: Int { 3 }
=======
  var itemPadding: Double { 6 }
  var sectionPadding: Double { 8 }
  var numSections: Int { 3 }
>>>>>>> 21c2b03 (Add Part 2 features (e.g., apply settings to board, theme, alien mode))
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
<<<<<<< HEAD
    return .zero
=======
    return UIEdgeInsets(top: sectionPadding, left: 0, bottom: 0, right: 0)
>>>>>>> 21c2b03 (Add Part 2 features (e.g., apply settings to board, theme, alien mode))
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return itemPadding
  }
<<<<<<< HEAD
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let numItemsInRow = Double(numItems(in: indexPath.section))
    let widthWithoutPadding = collectionView.frame.size.width - ((numItemsInRow - 1.0) * itemPadding)
    let widthPerItem = widthWithoutPadding / numItemsInRow
    let numRows = Double(numRows)
    let height = (collectionView.frame.size.height - (numRows - 1.0) * itemPadding) / numRows
    return CGSize(width: widthPerItem, height: height)
=======

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
      
    let numItemsInRow = Double(numItems(in: indexPath.section))

    let horizontalPadding = itemPadding * (numItemsInRow - 1)
    let horizontalSpace = collectionView.frame.size.width - horizontalPadding
    let cellWidth = (horizontalSpace / numItemsInRow).rounded(.down)

    let verticalPadding = sectionPadding * CGFloat(numSections)
    let verticalSpace = collectionView.frame.size.height - verticalPadding
    let cellHeight = (verticalSpace / CGFloat(numSections)).rounded(.down)

    return CGSize(width: cellWidth, height: cellHeight)
>>>>>>> 21c2b03 (Add Part 2 features (e.g., apply settings to board, theme, alien mode))
  }
}
