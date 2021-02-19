//
//  BehaviorRelay.swift
//  TheMovieApp
//
//  Created by Mozes Vidami on 2/12/21.
//

import RxRelay

extension BehaviorRelay where Element: RangeReplaceableCollection {

    func add(element: Element.Element) {
        var array = self.value
        array.append(element)
        self.accept(array)
    }
}
