import Foundation

class EngVi{
    static func convertToString(num: Int) -> (english: String, vietnam: String)? {
        let unitsEng = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
        let tensEng = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
        let unitsVie = ["không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín", "mười"]
        
        var engResult:String
        var viResult: String
        
        //Eng
        if num < 20{
            engResult = unitsEng[num]
        } else if num >= 20 && num % 10 == 0{
            let index = num / 10
            engResult = tensEng[index]
        } else {
            let ten = num / 10
            let unit = num % 10
            engResult = tensEng[ten] + " " + unitsEng[unit]
        }
        
        //Vi
        if num <= 10{
            viResult = unitsVie[num]
        } else if num > 10 && num % 10 == 0{
            viResult = unitsVie[num / 10] + " mươi"
        } else {
            let chuc = num / 10
            let donvi = num % 10
            if donvi == 5 {
                viResult = unitsVie[chuc] + " mươi lăm"
            } else if donvi == 1 {
                viResult = unitsVie[chuc] + " mươi mốt"
            } else {
                viResult = unitsVie[chuc] + " mươi " + unitsVie[donvi]
            }
        }
        
        return (engResult, viResult)
    }
}
