package pwr.wojciechowski.romanczyk.gymtracker

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper


class DBHelper(context: Context) : SQLiteOpenHelper(context, DATABASE_NAME, null, DATABASE_VERSION) {

    override fun onCreate(sqLiteDatabase: SQLiteDatabase) {
        val CREATE_TABLE_EXERCISE = ("CREATE TABLE " + Exercise.TABLE+ "("
                + Exercise.KEY_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, "
                + Exercise.KEY_TYPE + " TEXT, "
                + Exercise.KEY_REPS + " INTEGER, "
                + Exercise.KEY_DATE + " TEXT, "
                + Exercise.KEY_WEIGHT + " REAL )")
        val CREATE_TABLE_WEIGHT = ("CREATE TABLE " + Weight.TABLE + "("
                + Weight.KEY_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, "
                + Weight.KEY_DATE + " TEXT UNIQUE, "
                + Weight.KEY_WEIGHT + " REAL )")
        val CREATE_TABLE_WEIGHT_GOAL = ("CREATE TABLE " + WeightGoal.TABLE + "("
                + Weight.KEY_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, "
                + Weight.KEY_DATE + " TEXT )")
        sqLiteDatabase.execSQL(CREATE_TABLE_WEIGHT)
        sqLiteDatabase.execSQL(CREATE_TABLE_EXERCISE)
        sqLiteDatabase.execSQL(CREATE_TABLE_WEIGHT_GOAL)
    }

    override fun onUpgrade(sqLiteDatabase: SQLiteDatabase, i: Int, i1: Int) {
        // NOT FOR PRODUCTION
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + Weight.TABLE)
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + WeightGoal.TABLE)
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + Exercise.TABLE)
        onCreate(sqLiteDatabase)
    }

    companion object {
        var DATABASE_VERSION = 4
        var DATABASE_NAME = "database.db"
    }
}
