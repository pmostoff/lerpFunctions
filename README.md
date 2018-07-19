# lerpFunctions

This Swift Playground contains functions relating to and demonstrating functions of linear interpolation.

### `lerp`
This function demonstrates linear interpolation, which allows you to find an unknown point along the path between two known points. This function takes three arguments: `pointOne` and `pointTwo` are `Double` values and `percentage` is a `Double` value between `0.0` and `1.0`. This function returns a `Double` value that is the result of traveling along the path between `pointOne` and `pointTwo` by the `percentage` amount.

### `lerpRange`
This function takes three arguments: `pointOne` and `pointTwo` are both `Double` values while `percentages` is an array of `Double` values representing percentages (between `0.0` and `1.0`). This function returns an array of `Double` values that are the result of interpolating between the two provided points by each `percentage` value in the `percentages` array.

Note: If you're use case calls for passing `lerpRange` a percentage array that is equally spaced, you may find another function I wrote, `intervalRange`, useful. You can check out [intervalRange](https://github.com/pmostoff/intervalRange) in my repositories.

### `biLerp`
This function demonstrates bilinear interpolation, which allows you to find an unknown point within a four point grid. This function takes six arguments: `topLeft`, `topRight`, `bottomLeft`, and `bottomRight` are `Double` values and represent the corners of the four point grid. `xPercentage` and `yPercentage` accept `Double` values between `0.0` and `1.0`, and represent the percentage of the path that you want to travel along the X and Y axis to find your unknown point.

## Note On Extensibility
For the sake of flexibility, I wrote these functions to accept and work on `Double` values. When working with graphing, this would call for you to pass in the `X` and `Y` coordinates of a point separately and then combine the two results back into a single point, as demonstrated in the Playground. While this may seem unnecessarily complex, I found this to be the best way to demonstrate the process in a straight-forward way while leaving things open for modification. For example, a user could fairly quickly modify these funcitons to accept and return tuples of `Double` values in the form of `(x: Double, y: Double)`. However, you may not wish or need to do this. In my original use case for working with linear interpolation I was not working with a coordinate-point based system, and so I wanted to present this demonstration code with the same amount of flexibility.

## Installation
Simply copy and paste the `lerp`, `biLerp`, and `lerpRange` functions into your project. 

Please note that both the `biLerp` and `lerpRange` functions are dependent on the `lerp` function. When using either function, you must include `lerp` in your project as well.

## Requirements
`lerpFunctions` was built and tested using:
- Swift 4

## Author

Programmed and designed by Peter Mostoff. [You can contact me via Twitter](https://twitter.com/pmostoff) if that's something you're interested in. I typically make things for the situations that they're needed in but I like to share my work and I'm sure there are plenty of ways that this can be improved. Please let me know if you have any cool suggestions!

If you're interested, you can visit my personal site to see what I'm up to at [Mostoff.me](http://mostoff.me) or if you want to support my work, check out the apps that I've published on the [App Store](https://itunes.apple.com/tc/developer/peter-mostoff/id1080412491)!

## License
`lerpFunctions` is available under the MIT license. See the LICENSE file for more info.
