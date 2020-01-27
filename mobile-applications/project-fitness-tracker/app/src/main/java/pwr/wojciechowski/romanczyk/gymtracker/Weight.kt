package pwr.wojciechowski.romanczyk.gymtracker

import java.util.Date

class Weight(var weight: Double = 0.0, date: Date? = null) {

    var weightId: Int = 0
    var date: Date? = date
    set(date) {
        date?.seconds = 0
        date?.minutes = 0
        date?.hours = 0
        field = date
    }

    companion object {
        var TABLE = "Weight"

        var KEY_ID = "id"
        var KEY_DATE = "date"
        var KEY_WEIGHT = "weight"
    }

}