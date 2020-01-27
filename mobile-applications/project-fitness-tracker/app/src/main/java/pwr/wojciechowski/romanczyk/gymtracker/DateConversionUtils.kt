package pwr.wojciechowski.romanczyk.gymtracker

import android.annotation.SuppressLint
import java.text.SimpleDateFormat
import java.util.*

class DateConversionUtils {
    companion object {
        @SuppressLint("SimpleDateFormat")
        fun stringToDate(string: String): Date? {
            return SimpleDateFormat("dd/MM/yy").parse(string) ?: null
        }

        @SuppressLint("SimpleDateFormat")
        fun dateToString(date: Date): String {
            return SimpleDateFormat("dd/MM/yy").format(date)
        }
    }
}