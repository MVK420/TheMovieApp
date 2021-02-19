//
//  UILabel.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/18/21.
//

import UIKit

extension UILabel {

    func countLabelLines() -> Int {
      let myText = self.text! as NSString
      let attributes = [NSAttributedString.Key.font: self.font]

      let labelSize = myText.boundingRect(with: CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes as [NSAttributedString.Key : Any], context: nil)
      return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
  }
    func isTruncatedOrNot() -> Bool {

      if self.countLabelLines() > self.numberOfLines {
          return true
      }
      return false
  }
}
