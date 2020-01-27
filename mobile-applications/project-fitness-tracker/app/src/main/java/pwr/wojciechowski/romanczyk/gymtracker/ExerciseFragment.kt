package pwr.wojciechowski.romanczyk.gymtracker

import android.support.v4.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import kotlinx.android.synthetic.main.exercise_fragment_layout.view.*
import java.text.SimpleDateFormat
import java.util.*

class ExerciseFragment : Fragment(), View.OnClickListener{

    private var root: View? = null

    companion object {
        fun newInstance(): ExerciseFragment {
            return ExerciseFragment()
        }
    }

    override fun onClick(v: View?) {
        if(v!!.id == R.id.bAddExercise) {
            val dbHandler = DBHandler(context!!)
            val scrollView = root!!.tableLayout
            val exercise = Exercise()
            exercise.date = Date()
            exercise.reps = root!!.etReps.text.toString().toInt()
            exercise.weight = root!!.etWeight.text.toString().toDouble()
            exercise.type = ExerciseTypes.valueOf(root!!.sExerciseType.selectedItem.toString())
            dbHandler.insert(exercise)
            scrollView.addView(exerciseToTableRow(exercise))
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        root = inflater.inflate(R.layout.exercise_fragment_layout, container, false)
        listAllExercises(root!!)
        root!!.bAddExercise.setOnClickListener(this)
        return root
    }


    private fun listAllExercises(view: View) {
        val scrollView = view.tableLayout
        val dbHandler = DBHandler(context!!)
        val exerciseList = dbHandler.getExerciseList()
        for (i in exerciseList) {
            val tableRow = exerciseToTableRow(i)
            scrollView.addView(tableRow)
        }
    }

    private fun exerciseToTableRow(exercise: Exercise): TableRow {
        val tableRow = TableRow(this.context)
        val tvType = TextView(this.context)
        val tvDate = TextView(this.context)
        val tvReps = TextView(this.context)
        val tvWeight = TextView(this.context)


        tvType.text = exercise.type.toString()
        tvDate.text =  SimpleDateFormat("dd/MM/yy").format(exercise.date)
        tvReps.text =  exercise.reps.toString()
        tvWeight.text = exercise.weight.toString()

        var layoutParams = TableRow.LayoutParams(0, TableRow.LayoutParams.WRAP_CONTENT, 1f)
        tvType.layoutParams = layoutParams
        layoutParams = TableRow.LayoutParams(1, TableRow.LayoutParams.WRAP_CONTENT, 1f)
        tvDate.layoutParams = layoutParams
        layoutParams = TableRow.LayoutParams(2, TableRow.LayoutParams.WRAP_CONTENT, 1f)
        tvReps.layoutParams = layoutParams
        layoutParams = TableRow.LayoutParams(3, TableRow.LayoutParams.WRAP_CONTENT, 1f)
        tvWeight.layoutParams = layoutParams

        tableRow.addView(tvType)
        tableRow.addView(tvDate)
        tableRow.addView(tvReps)
        tableRow.addView(tvWeight)

        return tableRow
    }
}
