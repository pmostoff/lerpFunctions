import UIKit

/// Performs linear interpolation on two given points to find an unknown point along their intermediate path.
///
/// - Parameters:
///     - pointOne: A `Double` value that represents the first point along the linear path.
///     - pointTwo: A `Double` value that represents the second point along the linear path.
///     - percentage: A `Double` value between `0.0` and `1.0` that represents the distance between `pointOne` and `pointTwo` to travel.
///
/// - Returns: Produces a `Double` value along the path between `pointOne` and `pointTwo` at a distance based on `percentage`.
func lerp(from pointOne: Double, to pointTwo: Double, percentage: Double) -> Double {
    
    /// Keep the percentage variable within the 0.0 -> 1.0 range
    var percentage = percentage
    percentage = min(1, percentage)
    percentage = max(0, percentage)
    
    let resultPoint = pointOne + (pointTwo - pointOne) * percentage
    
    return resultPoint
}

/// Performs linear interpolation on two given points to find a list of unknown points along their intermediate path.
///
/// - Parameters:
///     - pointOne: A `Double` value that represents the first point along the linear path.
///     - pointTwo: A `Double` value that represents the second point along the linear path.
///     - percentages: An array of `Double` values between `0.0` and `1.0` that represents the distances between `pointOne` and `pointTwo` to travel.
///
/// - Returns: Produces an array of `Double` values along the path between `pointOne` and `pointTwo` at distances based on `percentages`.
func lerpRange(from pointOne: Double, to pointTwo: Double, percentages: [Double]) -> [Double] {
    
    var interpolatedPoints: [Double] = []
    for (index, _) in percentages.enumerated() {
        let interpolatedPoint = lerp(from: pointOne, to: pointTwo, percentage: percentages[index])
        interpolatedPoints.append(interpolatedPoint)
    }
    
    return interpolatedPoints
}

/// Performs bilinear interpolation on four given points to find an unknown point within their intermediate grid.
///
/// - Parameters:
///     - topLeft: A `Double` value that represents the top left point of the grid.
///     - topRight: A `Double` value that represents the top right point of the grid.
///     - bottomLeft: A `Double` value that represents the bottom left point of the grid.
///     - bottomRight: A `Double` value that represents the bottom right point of the grid.
///     - xPercentage: A `Double` value between `0.0` and `1.0` that represents the distance along the x-axis to travel within the grid.
///     - yPercentage: A `Double` value between `0.0` and `1.0` that represents the distance along the y-axis to travel within the grid.
///
/// - Returns: Produces a `Double` value within the four point grid between `toLeft`, `topRight`, `bottomLeft`, and `bottomRight` at a distance based on `xPercentage` and `yPercentage`.
func biLerp(topLeft: Double, topRight: Double, bottomLeft: Double, bottomRight: Double, xPercentage: Double, yPercentage: Double) -> (Double) {
    
    let topPoint = lerp(from: topLeft, to: topRight, percentage: xPercentage)
    let bottomPoint = lerp(from: bottomLeft, to: bottomRight, percentage: xPercentage)
    let bilinearLerpResult = lerp(from: bottomPoint, to: topPoint, percentage: yPercentage)
    
    return(bilinearLerpResult)
}

// Mark: - Demonstration Code

// Setup Demo Data
let pointOne = (x: 0.0, y: 100.0)
let pointTwo = (x: 100.0, y: 100.0)
let pointThree = (x: 0.0, y: 0.0)
let pointFour = (x: 100.0, y: 0.0)

// Linear Interpolation Results
let resultPoint = (x: lerp(from: pointOne.x, to: pointTwo.x, percentage: 0.5),
                   y: lerp(from: pointOne.y, to: pointTwo.y, percentage: 0.5))

// Linear Interpolation Range Results
let percentageRange = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
var resultRange: [(x: Double, y: Double)] = []
let xRange = lerpRange(from: pointOne.x, to: pointFour.x, percentages: percentageRange)
let yRange = lerpRange(from: pointOne.y, to: pointFour.y, percentages: percentageRange)

for (index, _) in percentageRange.enumerated() {
    let resultAtIndex = (x: xRange[index], y: yRange[index])
    resultRange.append(resultAtIndex)
}

resultRange

// Bilinear Interpolation Results
let biLerpX = biLerp(topLeft: pointOne.x,
                     topRight: pointTwo.x,
                     bottomLeft: pointThree.x,
                     bottomRight: pointFour.x,
                     xPercentage: 0.25,
                     yPercentage: 0.75)
let biLerpY = biLerp(topLeft: pointOne.y,
                     topRight: pointTwo.y,
                     bottomLeft: pointThree.y,
                     bottomRight: pointFour.y,
                     xPercentage: 0.25,
                     yPercentage: 0.75)
let biLerpResult = (x: biLerpX, y: biLerpY)
