package pwr.wojciechowski.romanczyk.gymtracker

import android.support.v4.app.Fragment
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import kotlinx.android.synthetic.main.overview_fragment_layout.view.*

class OverviewFragment : Fragment() {

    companion object {
        fun newInstance(): OverviewFragment {
            return OverviewFragment()
        }
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.overview_fragment_layout, container, false)

        val dbHandler = DBHandler(context!!)
        view.tvDayNumber.text = dbHandler.exerciseDays.toString()

        return view
    }
}
