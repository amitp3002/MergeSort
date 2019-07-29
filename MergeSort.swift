//
//  MergeSort.swift
//  
//
//  Created by Amit Patel on 7/29/19.
//

import Foundation

// MergeSort is O(nlogn) and is not an inplace sort.
func mergeSort(array:[Int])->[Int] {
    if array.count == 0 || array.count == 1 {
        return array
    }
    let midIndex = array.count/2
    let leftArray = mergeSort(array: Array(array[0..<midIndex]))
    let rightArray = mergeSort(array: Array(array[midIndex..<array.count]))
    return merge(left:leftArray, right:rightArray)
}


// Helper function for doing the actual merging after the initial splitting.
func merge(left:[Int], right:[Int])->[Int] {
    var sorted = [Int]()
    sorted.reserveCapacity(left.count + right.count)
    
    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            sorted.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            sorted.append(right[rightIndex])
            rightIndex += 1
        } else {
            sorted.append(left[leftIndex])
            leftIndex += 1
            sorted.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        sorted.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        sorted.append(right[rightIndex])
        rightIndex += 1
    }
    return sorted
}

