package wojciechowski.marcin.snake;

import android.content.Intent;
import android.graphics.Point;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;

public class SnakeActivity extends AppCompatActivity {

    SnakeViewSinglePlayer snakeViewSinglePlayer;
    SnakeViewTwoPlayer snakeViewTwoPlayer;
    int game_mode;
    public static Difficulty difficulty;
    public static ObstacleAmount obstacleAmount;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent intent = getIntent();
        game_mode = intent.getIntExtra(MenuActivity.GAME_MODE, 1);
        difficulty = Difficulty.valueOf(intent.getStringExtra(MenuActivity.DIFFICULTY));
        obstacleAmount = ObstacleAmount.valueOf(intent.getStringExtra(MenuActivity.OBSTACLES));

        Display display = getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getSize(size);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                        | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);

        if(game_mode == 1){
            snakeViewSinglePlayer = new SnakeViewSinglePlayer(this, size);
            setContentView(snakeViewSinglePlayer);
        } else {
            snakeViewTwoPlayer = new SnakeViewTwoPlayer(this, size);
            setContentView(snakeViewTwoPlayer);
        }

    }

    @Override
    protected void onResume() {
        super.onResume();
        if(game_mode == 1) {
            snakeViewSinglePlayer.resume();
        } else {
            snakeViewTwoPlayer.resume();
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        if(game_mode == 1) {
            snakeViewSinglePlayer.pause();
        } else {
            snakeViewTwoPlayer.pause();
        }
    }
}
