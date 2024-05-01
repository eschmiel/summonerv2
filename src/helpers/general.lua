color_enum = {
    black = 0,
    navy = 1,
    magenta = 2,
    dark_green = 3,
    brown = 4,
    charcoal = 5,
    grey = 6,
    white = 7,
    red = 8,
    orange = 9,
    yellow = 10,
    green = 11,
    blue = 12,
    grey_purple = 13,
    pink = 14,
    peach = 15
}

-- returns 1 if num is positive, -1 if num is negative
function getSign(num)
    return num / abs(num)
end