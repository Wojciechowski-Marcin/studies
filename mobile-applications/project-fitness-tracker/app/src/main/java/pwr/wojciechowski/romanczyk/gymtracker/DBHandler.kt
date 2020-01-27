package pwr.wojciechowski.romanczyk.gymtracker

import android.content.ContentValues
import android.content.Context
import android.database.Cursor
import android.database.DatabaseUtils
import android.database.sqlite.SQLiteConstraintException
import java.util.*

class DBHandler(context: Context) {
    private val dbHelper: DBHelper = DBHelper(context)

    val weightList: ArrayList<Weight>
        get() {
            val db = dbHelper.readableDatabase

            val selectQuery = "SELECT " +
                    Weight.KEY_ID + ", " +
                    Weight.KEY_DATE + ", " +
                    Weight.KEY_WEIGHT +
                    " FROM " + Weight.TABLE
            val weightList = ArrayList<Weight>()

            val cursor = db.rawQuery(selectQuery, null)
            if (cursor.moveToFirst()) {
                do {
                    val weight = Weight()
                    weight.weightId = cursor.getInt(cursor.getColumnIndex(Weight.KEY_ID))
                    weight.date = DateConversionUtils.stringToDate(cursor.getString(cursor.getColumnIndex(Weight.KEY_DATE)))
                    weight.weight = cursor.getDouble(cursor.getColumnIndex(Weight.KEY_WEIGHT))
                    weightList.add(weight)
                } while (cursor.moveToNext())
            }

            cursor.close()
            db.close()
            return weightList
        }

    val weightGoal: WeightGoal
        get() {
            val db = dbHelper.readableDatabase
            val selectQuery = "SELECT " +
                    WeightGoal.KEY_ID + ", " +
                    WeightGoal.KEY_DATE +
                    " FROM " + WeightGoal.TABLE
            var currentGoal: WeightGoal? = null
            val cursor = db.rawQuery(selectQuery, null)
            if (cursor.moveToFirst()) {
                currentGoal = WeightGoal()
                currentGoal.goalId = cursor.getInt(cursor.getColumnIndex(Weight.KEY_ID))
                currentGoal.finalDate = DateConversionUtils.stringToDate(cursor.getString(cursor.getColumnIndex(Weight.KEY_DATE)))
            }
            cursor.close()
            db.close()
            return currentGoal!!
        }

    fun getExerciseList(date: String? = null): ArrayList<Exercise> {
        val db = dbHelper.readableDatabase

        var selectQuery = "SELECT " +
                Exercise.KEY_ID + ", " +
                Exercise.KEY_DATE + ", " +
                Exercise.KEY_TYPE + ", " +
                Exercise.KEY_REPS + ", " +
                Exercise.KEY_WEIGHT +
                " FROM " + Exercise.TABLE
        if(date != null) selectQuery  += " WHERE " + Exercise.KEY_DATE + "=?"
        val exerciseList = ArrayList<Exercise>()

        val cursor =
            if(date != null)
                db.rawQuery(selectQuery, arrayOf(date))
            else
                db.rawQuery(selectQuery, null)
        if (cursor.moveToFirst()) {
            do {
                val exercise = Exercise()
                exercise.exerciseId= cursor.getInt(cursor.getColumnIndex(Exercise.KEY_ID))
                exercise.date = DateConversionUtils.stringToDate(cursor.getString(cursor.getColumnIndex(Exercise.KEY_DATE)))
                exercise.type = ExerciseTypes.valueOf(cursor.getString(cursor.getColumnIndex(Exercise.KEY_TYPE)))
                exercise.reps = cursor.getInt(cursor.getColumnIndex(Exercise.KEY_REPS))
                exercise.weight = cursor.getDouble(cursor.getColumnIndex(Exercise.KEY_WEIGHT))
                exerciseList.add(exercise)
            } while (cursor.moveToNext())
        }

        cursor.close()
        db.close()
        return exerciseList
    }

    val exerciseDays: Long
        get() {
            val db = dbHelper.readableDatabase

            val selectQuery = "SELECT COUNT (DISTINCT " +
                    Exercise.KEY_DATE + ")" +
                    " FROM " + Exercise.TABLE

            val exDays = DatabaseUtils.longForQuery(db, selectQuery, null)

            db.close()
            return exDays
        }

    fun insert(weight: Weight): Int {
        val db = dbHelper.writableDatabase
        val values = ContentValues()
        values.put(Weight.KEY_DATE, DateConversionUtils.dateToString(weight.date!!))
        values.put(Weight.KEY_WEIGHT, weight.weight)
        val query = "SELECT ${Weight.KEY_ID} FROM ${Weight.TABLE} WHERE ${Weight.KEY_DATE} LIKE '${DateConversionUtils.dateToString(weight.date!!)}'"
        val cursor : Cursor = db.rawQuery(query,null)
        if(cursor.moveToFirst()) {
            do {
                db.delete(Weight.TABLE, Weight.KEY_ID + "= ?", arrayOf(cursor.getInt(cursor.getColumnIndex(Weight.KEY_ID)).toString()))
            } while (cursor.moveToNext())
        }
        val weightId = db.insert(Weight.TABLE, null, values)
        db.close()
        return weightId.toInt()
    }

    fun delete_weight(weight_id: Int) {
        val db = dbHelper.writableDatabase
        db.delete(Weight.TABLE, Weight.KEY_ID + "= ?", arrayOf(weight_id.toString()))
        db.close()
    }

    fun insert(goal: WeightGoal): Int {
        // delete previous goal before setting the new one
        delete_goal()
        val db = dbHelper.writableDatabase
        val values = ContentValues()
        values.put(WeightGoal.KEY_DATE, DateConversionUtils.dateToString(goal.finalDate!!))
        val goalId = db.insert(WeightGoal.TABLE, null, values)
        db.close()
        return goalId.toInt()
    }

    fun delete_goal() {
        val db = dbHelper.writableDatabase
        db.execSQL("delete * from " + WeightGoal.TABLE)
        db.close()
    }

    fun insert(exercise: Exercise): Int {
        val db = dbHelper.writableDatabase
        val values = ContentValues()
        values.put(Exercise.KEY_DATE, DateConversionUtils.dateToString(exercise.date!!))
        values.put(Exercise.KEY_TYPE, exercise.type.toString())
        values.put(Exercise.KEY_REPS, exercise.reps)
        values.put(Exercise.KEY_WEIGHT, exercise.weight)

        val exerciseId = db.insert(Exercise.TABLE, null, values)
        db.close()
        return exerciseId.toInt()
    }

    fun delete_exercise(exercise_id: Int) {
        val db = dbHelper.writableDatabase
        db.delete(Exercise.TABLE, Weight.KEY_ID + "= ?", arrayOf(exercise_id.toString()))
        db.close()
    }

}
