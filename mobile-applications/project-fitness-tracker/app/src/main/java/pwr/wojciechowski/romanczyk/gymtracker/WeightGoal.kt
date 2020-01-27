package pwr.wojciechowski.romanczyk.gymtracker

import java.util.Date

class WeightGoal {
    var goalId: Int = 0
    var finalDate: Date? = null

    companion object {
        var TABLE = "Goal"
        var KEY_ID = "id"
        var KEY_DATE = "date"
    }
}
