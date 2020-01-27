package pwr.wojciechowski.romanczyk.gymtracker

import android.app.Dialog
import android.opengl.Visibility
import android.support.v4.app.Fragment
import android.os.Bundle
import android.support.v4.content.ContextCompat
import android.text.Layout
import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.github.mikephil.charting.charts.LineChart
import com.github.mikephil.charting.components.XAxis
import com.github.mikephil.charting.data.Entry
import com.github.mikephil.charting.data.LineData
import com.github.mikephil.charting.data.LineDataSet
import com.github.mikephil.charting.formatter.IndexAxisValueFormatter
import com.github.mikephil.charting.highlight.Highlight
import com.github.mikephil.charting.listener.ChartTouchListener
import com.github.mikephil.charting.listener.OnChartGestureListener
import com.github.mikephil.charting.listener.OnChartValueSelectedListener
import com.github.mikephil.charting.utils.Utils
import kotlinx.android.synthetic.main.add_weight_dialog.view.*
import kotlinx.android.synthetic.main.add_weight_dialog.view.textView33
import kotlinx.android.synthetic.main.confirm_delete_dialog.view.*
import kotlinx.android.synthetic.main.weight_fragment_layout.*
import kotlinx.android.synthetic.main.weight_fragment_layout.view.*
import java.lang.NumberFormatException
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList


class WeightFragment : Fragment(),  View.OnClickListener, OnChartGestureListener, OnChartValueSelectedListener{


    private var weightChart : LineChart? = null
    private var root: View? = null
    private var currentSet : ArrayList<Weight>? = null
    private var currentDateLabels : ArrayList<String>? = null
    private var testDataIsOn : Boolean = true

    override fun onChartGestureEnd(me: MotionEvent?, lastPerformedGesture: ChartTouchListener.ChartGesture?) {
        return
    }

    override fun onChartFling(me1: MotionEvent?, me2: MotionEvent?, velocityX: Float, velocityY: Float) {
        return
    }

    override fun onChartSingleTapped(me: MotionEvent?) {
        return
    }

    override fun onChartGestureStart(me: MotionEvent?, lastPerformedGesture: ChartTouchListener.ChartGesture?) {
        return
    }

    override fun onChartScale(me: MotionEvent?, scaleX: Float, scaleY: Float) {
        return
    }

    override fun onChartLongPressed(me: MotionEvent?) {
        return
    }

    override fun onChartDoubleTapped(me: MotionEvent?) {
        return
    }

    override fun onChartTranslate(me: MotionEvent?, dX: Float, dY: Float) {
        return
    }

    override fun onNothingSelected() {
        return
    }

    override fun onValueSelected(e: Entry?, h: Highlight?) {
        if(!testDataIsOn) {
            weightChart?.highlightValue(null)
            val selectedWeight = findMatchingWeight(e?.y?.toDouble()!!, currentDateLabels?.get(e.x.toInt())!!)
            val dialog = Dialog(context)
            val layout = layoutInflater.inflate(R.layout.add_weight_dialog, null)
            layout.textView33.text = getString(R.string.modify_weight)
            dialog.setContentView(layout)

            val bSaveWeight = layout.bSaveWeight
            bSaveWeight.setOnClickListener {
                val newWeight : String? = layout.etSaveWeight.text.toString()
                val converted = convertUserEntryToDouble(newWeight)
                if(converted != null && selectedWeight != null) {
                    modifyExistingData(selectedWeight, converted)
                }
                dialog.dismiss()
            }
            dialog.show()
        }
    }

    companion object {
        fun newInstance(): WeightFragment {
            return WeightFragment()
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Utils.init(context!!)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        super.onCreateView(inflater, container, savedInstanceState)
        root = inflater.inflate(R.layout.weight_fragment_layout, container, false)
        root!!.fabutton.setOnClickListener(this)
        root!!.fabutton2.setOnClickListener(this)
        root!!.fabutton3.setOnClickListener(this)
        return root
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        weightChart = weight_chart
        weightChart?.setTouchEnabled(true)
        weightChart?.onChartGestureListener = this
        weightChart?.setOnChartValueSelectedListener(this@WeightFragment)
        weightChart?.setScaleEnabled(true)
        weightChart?.setPinchZoom(false)
        weightChart?.setDrawBorders(false)
        weightChart?.maxHighlightDistance = 20.0f
        weightChart?.xAxis?.isGranularityEnabled = true
        weightChart?.xAxis?.granularity = 5.0f
        weightChart?.xAxis?.position = XAxis.XAxisPosition.BOTTOM_INSIDE
        weightChart?.xAxis?.textColor = ContextCompat.getColor(context!!, R.color.colorAccent)
        weightChart?.xAxis?.textSize = 13.0f
        weightChart?.xAxis?.setDrawAxisLine(false)
        weightChart?.axisLeft?.setDrawAxisLine(false)
        weightChart?.axisRight?.setDrawAxisLine(false)
        weightChart?.axisLeft?.gridLineWidth = 3.0f
        weightChart?.axisLeft?.textSize = 13.0f
        weightChart?.axisLeft?.textColor = ContextCompat.getColor(context!!, R.color.colorAccent)
        weightChart?.axisLeft?.granularity = 1.0f
        weightChart?.axisRight?.setDrawLabels(false)
        weightChart?.isHighlightPerTapEnabled = true
        weightChart?.setGridBackgroundColor(ContextCompat.getColor(context!!, R.color.chartBackground))
        weightChart?.description?.isEnabled = false
        weightChart?.description?.setPosition((weightChart?.width!!/2).toFloat(),(weightChart?.height!!/2).toFloat() )
        weightChart?.description?.textSize = 30.0f
        weightChart?.description?.textColor = ContextCompat.getColor(context!!, R.color.colorAccent)
        weightChart?.legend?.isEnabled = false
        weightChart?.xAxis?.setAvoidFirstLastClipping(true)
        weightChart?.xAxis?.gridLineWidth = 3.0f
        weightChart?.xAxis?.setDrawGridLines(false)
        weightChart?.setDrawBorders(false)
        populateWithTestData()
        if(!checkIfThereIsAnyData()) {
            updateChartValues()
        }

    }

    override fun onClick(selectedView: View?) {
        when (selectedView?.id) {
            R.id.fabutton -> {
                if(!testDataIsOn) {
                    val dialog = Dialog(context)
                    val layout = layoutInflater.inflate(R.layout.add_weight_dialog, null)
                    layout.textView33.text = getString(R.string.add_weight)
                    dialog.setContentView(layout)

                    val bSaveWeight = layout.bSaveWeight
                    bSaveWeight.setOnClickListener {
                        val newWeight : String? = layout.etSaveWeight.text.toString()
                        val converted = convertUserEntryToDouble(newWeight)
                        if(converted != null) {
                            addNewData(converted)
                        }
                        dialog.dismiss()
                    }
                    dialog.show()
                }
            }
            R.id.fabutton2 -> {
                testDataIsOn = !testDataIsOn
                if(testDataIsOn) {
                    populateWithTestData()
                }
                updateChartValues()
            }
            R.id.fabutton3 -> {
                if(!testDataIsOn) {
                    val dialog = Dialog(context)
                    val layout = layoutInflater.inflate(R.layout.confirm_delete_dialog, null)
                    dialog.setContentView(layout)

                    val okClicked = layout.ConfirmDeleteButton
                    okClicked.setOnClickListener {
                        deleteAllExistingData()
                        dialog.dismiss()
                    }
                    val cancelClicked = layout.CancelDeleteButton
                    cancelClicked.setOnClickListener {
                        dialog.dismiss()
                    }
                    dialog.show()
                }
            }
        }
    }

    private fun checkIfThereIsAnyData() : Boolean {
        return getStoredData().isEmpty()
    }


    private fun getStoredData() : ArrayList<Weight>{
        return if(testDataIsOn) {
            currentSet!!
        } else {
            DBHandler(context!!).weightList
        }
    }

    private fun prepareDataSet() : Pair<LineDataSet, ArrayList<String>> {
        val weightData = getStoredData()
        currentSet = weightData
        val weightEntries = ArrayList<Entry>()
        val xAxisLabels = ArrayList<String>()
        for((i,w) in weightData.withIndex()) {
            weightEntries.add(Entry(i.toFloat(), w.weight.toFloat()))
            xAxisLabels.add(SimpleDateFormat("dd/MM/yy").format(w.date))
        }
        var weightDataSet = LineDataSet(weightEntries, null)
        currentDateLabels = xAxisLabels
        weightDataSet = formatDataSet(weightDataSet)
        return Pair(weightDataSet, xAxisLabels)
    }

    private fun addNewData(input: Double) {
        val dbHandler = DBHandler(this.context!!)
        val weight = Weight()

        weight.weight = input
        weight.date = Calendar.getInstance().time
        dbHandler.insert(weight)
        updateChartValues()
    }

    private fun modifyExistingData(weight : Weight, newWeightValue: Double) {
        val dbHandler = DBHandler(this.context!!)
        weight.weight = newWeightValue
        dbHandler.insert(weight)
        updateChartValues()
    }

    private fun updateChart() {
        weightChart?.invalidate()
        weightChart?.notifyDataSetChanged()
        weightChart?.animateX(1000)
    }

    private fun formatDataSet(set : LineDataSet) : LineDataSet {
        set.lineWidth = 2.5f
        set.circleRadius = 10f
        set.color = ContextCompat.getColor(context!!, R.color.colorPrimaryDark)
        set.setCircleColor(ContextCompat.getColor(context!!, R.color.colorPrimary))
        set.setDrawValues(false)
        set.setGradientColor(ContextCompat.getColor(context!!, R.color.colorAccentLight), ContextCompat.getColor(context!!, R.color.colorAccent))
        return set
    }

    private fun findMatchingWeight(weight: Double, date: String) : Weight? {
        val match = currentSet?.filter{w -> w.weight == weight && DateConversionUtils.dateToString(w.date!!) == date }
        return match?.single()
    }

    private fun convertUserEntryToDouble(newData: String?) : Double? {
        return try {
                newData?.toDouble()
        } catch (e : NumberFormatException) {
            return null
        }
    }

    private fun updateChartValues() {
        val pair = prepareDataSet()
        val lineData = LineData(pair.first)
        weightChart?.data = lineData
        weightChart?.xAxis?.valueFormatter = IndexAxisValueFormatter(pair.second)
        if(checkIfThereIsAnyData()) {
            root?.noDataText?.visibility = View.VISIBLE
        } else {
            root?.noDataText?.visibility = View.GONE
        }
        updateChart()
    }

    private fun populateWithTestData() {
        val cal = Calendar.getInstance()
        currentSet = ArrayList()
        for( i in (0..15) ) {
            currentSet?.add(Weight(89.0 - i + (-2..2).random(), cal.time))
            cal.add(Calendar.HOUR, 72)
        }
    }

    private fun deleteAllExistingData() {
        val dbHandler = DBHandler(this.context!!)
        val weights = getStoredData()
        for(weight in weights) {
            dbHandler.delete_weight(weight.weightId)
        }
        updateChartValues()
    }


}
