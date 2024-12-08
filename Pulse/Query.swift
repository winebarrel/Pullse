import Foundation

enum Query {
    private static func combine(_ arrs: [[String]]) -> [[String]] {
        if arrs.isEmpty {
            return []
        }

        func combine0(_ arrSet: [[String]], _ oneArr: [String]) -> [[String]] {
            var combined0: [[String]] = []

            for arr in arrSet {
                for item in oneArr {
                    combined0.append(arr + [item])
                }
            }

            return combined0
        }

        var combined: [[String]] = arrs[0].map { [$0] }

        for arr in arrs.dropFirst(1) {
            combined = combine0(combined, arr)
        }

        return combined
    }

    static func parse(_ query: String) -> [String] {
        var result: [[String]] = []

        let scanner = Scanner(string: query)

        while !scanner.isAtEnd {
            guard var part = scanner.scanUpToString("{") else {
                break
            }

            part = part.trimmingCharacters(in: .whitespacesAndNewlines)

            if !part.isEmpty {
                result.append([part])
            }

            guard scanner.scanString("{") != nil else {
                break
            }

            guard var phrases = scanner.scanUpToString("}") else {
                result.append(["{"])
                break
            }

            guard scanner.scanString("}") != nil else {
                result.append(["{" + phrases])
                break
            }

            phrases = phrases.trimmingCharacters(in: .whitespacesAndNewlines)

            if phrases.isEmpty {
                break
            }

            var phraseList: [String] = []

            for phrase in phrases.components(separatedBy: .whitespacesAndNewlines) where !phrase.isEmpty {
                phraseList.append(phrase)
            }

            result.append(phraseList)
        }

        let combined = combine(result)
        return combined.map { $0.joined(separator: " ") }
    }
}
