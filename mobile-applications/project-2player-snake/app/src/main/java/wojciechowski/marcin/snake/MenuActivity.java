package wojciechowski.marcin.snake;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;

public class MenuActivity extends AppCompatActivity {

    public final static String GAME_MODE = "GAME_MODE";
    public final static String DIFFICULTY = "DIFFICULTY";
    public final static String OBSTACLES = "OBSTAClES";
    Button bSinglePlayer;
    Button bTwoPlayer;
    Spinner spDifficultyPicker;
    Spinner spObstaclePicker;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);

        bSinglePlayer = findViewById(R.id.bSinglePlayer);
        bTwoPlayer = findViewById(R.id.bTwoPlayer);
        spDifficultyPicker = findViewById(R.id.spDifficultyPicker);
        spObstaclePicker = findViewById(R.id.spObstaclePicker);

    }

    public void singlePlayer(View view) {
        Intent intent = new Intent(view.getContext(), SnakeActivity.class);
        intent.putExtra(GAME_MODE, 1);
        intent.putExtra(DIFFICULTY, spDifficultyPicker.getSelectedItem().toString());
        intent.putExtra(OBSTACLES, spObstaclePicker.getSelectedItem().toString());
        startActivity(intent);
    }

    public void twoPlayer(View view) {
        Intent intent = new Intent(view.getContext(), SnakeActivity.class);
        intent.putExtra(GAME_MODE, 2);
        intent.putExtra(DIFFICULTY, spDifficultyPicker.getSelectedItem().toString());
        intent.putExtra(OBSTACLES, spObstaclePicker.getSelectedItem().toString());
        startActivity(intent);
    }

    public void instructions(View view) {
        startActivity(new Intent(view.getContext(), Instructions.class));
    }
}
