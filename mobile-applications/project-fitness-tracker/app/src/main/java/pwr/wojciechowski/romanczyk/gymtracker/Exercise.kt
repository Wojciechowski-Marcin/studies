package pwr.wojciechowski.romanczyk.gymtracker

import java.util.Date

class Exercise {

    var exerciseId: Int = 0
    var date: Date? = null
    var type: ExerciseTypes? = null
    var reps: Int = 0
    var weight: Double = 0.toDouble()

    companion object {

        val TABLE = "Exercise"
        val KEY_ID = "id"
        val KEY_DATE = "date"
        val KEY_TYPE = "type"
        val KEY_REPS = "reps"
        val KEY_WEIGHT = "weight"
    }

}