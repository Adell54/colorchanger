# Explanation

Random Color Generation:
The getRandomColor() method uses Random() to generate a random RGB color.

Gradient Effect:
The app uses a LinearGradient that transitions from the random base color to a darker version (created through changing the alpha value).

Direction Cycling:
The directions list holds four pairs of alignment values that define the gradientss start and end. Each tap on the Change Direction button cycles to the next gradient alignment.
