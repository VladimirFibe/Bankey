import UIKit

struct CurrencyFormatter {
    func makeAttributedCurrency(_ amount: Decimal) -> NSMutableAttributedString {
        let tuple = breakIntoDollarsAndCents(amount)
        return makeFormattedBalance(dollars: tuple.0, cents: tuple.1)
    }
    
    private func breakIntoDollarsAndCents(_ amount: Decimal) -> (String, String) {
        let double = NSDecimalNumber(decimal: amount).doubleValue
        let tuple = modf(double)
        let dollars = convertDollar(tuple.0)
        let cents = convertCents(tuple.1)
        return (dollars, cents)
    }
    
    private func convertDollar(_ dollarPart: Double) -> String {
        let dollarsWithDecimal = dollarsFormatted(dollarPart)
        let formatter = NumberFormatter()
        let decimalSeparator = formatter.decimalSeparator!
        let dollarComponents = dollarsWithDecimal.components(separatedBy: decimalSeparator)
        var dollars = dollarComponents.first!
        dollars.removeFirst()
        return dollars
    }
    
    private func convertCents(_ centPart: Double) -> String {
        let cent = (centPart * 100.0).rounded()
        return String(format: "%.02d", Int(cent))
    }
    
    private func dollarsFormatted(_ dollars: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        if let result = formatter.string(from: dollars as NSNumber) {
            return result
        } else {
            return ""
        }
    }
    
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any]
        = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any]
        = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any]
        = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}
