extension Substring {
    var isInt: Bool {
        return Int(self) != nil
    }
}


func isGoodBatchSingle(_ b: String) -> Bool {
    let q_start = b.firstIndex(of: "Q")
    let p_start = b.firstIndex(of: "p")
    let d_start = b.firstIndex(of: "d")

    if q_start == nil || p_start == nil || d_start == nil {
        return false
    }
    
    // Q10p8d2
    if p_start! < d_start! {
        // print("p_start < q_start")
        var q: Int
        var p: Int
        var d: Int

        let q_value = b[q_start!..<p_start!].dropFirst()
        if q_value.isInt {
            q = Int(q_value)!
        } else {
            // print("q_value.isInt")
            return false
        }

        let p_value = b[p_start!..<d_start!].dropFirst()
        if p_value.isInt {
            p = Int(p_value)!
        } else {
            // print("p_value.isInt")
            return false
        }

        let d_value = b[d_start!..<b.endIndex].dropFirst()
        if d_value.isInt {
            d = Int(d_value)!
        } else {
            // print("d_value.isInt")
            return false
        }

        if p + d == q {
            return true
        }

    } else if d_start! < p_start! { // Q10d2p8
        // print("d_start < p_start")
        let q: Int
        let p: Int
        let d: Int

        let q_value = b[q_start!..<d_start!].dropFirst()
        // print(q_value)
        if q_value.isInt {
            q = Int(q_value)!
        } else {
            // print("q_value.isInt")
            return false
        }

        let d_value = b[d_start!..<p_start!].dropFirst()
        if d_value.isInt {
            d = Int(d_value)!
        } else {
            // print("d_value.isInt")
            return false
        }

        let p_value = b[p_start!..<b.endIndex].dropFirst()
        if p_value.isInt {
            p = Int(p_value)!
        } else {
            // print("p_value.isInt")
            return false
        }

        if p + d == q {
            return true
        }
    }
    return false
}

func isGoodBatch(_ b: String) -> Bool {
    // Check if there are multiple batches
    let batches = b.split(separator: "Q")
    if batches.count == 1 {
        return isGoodBatchSingle(b)
    } else {
        for batch in batches {
            if !isGoodBatchSingle(String(batch)) {
                return false
            }
        }
        return true
    }
}