package wojciechowski.marcin.snake;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

/**
 * Created by marcin on 21.03.18.
 */

class SnakeViewSinglePlayer extends SurfaceView implements Runnable{

    private Thread thread;
    private SurfaceHolder holder;
    private Canvas canvas;
    private Paint paint;

    boolean isPlaying;

    private int screenWidth;
    private int screenHeight;

    private int score;
    private int personalBest;

    private final int SNAKE_LEN_BEGIN = 3;


    private int blockSize;
    private final int blockNrX = 40;
    private int blockNrY;

    private RectF endGameButton;

    private SharedPreferences preferences;
    private static final String PREFERENCES_NAME = "myPreferences";
    private static final String PREFERENCES_BEST = "personalBest";

    private Difficulty difficulty;
    private ObstacleAmount obstacleAmount;

    Snake snake;
    Snack snack;
    ObstacleManager obstacleManager;

    public SnakeViewSinglePlayer(Context context, Point size) {
        super(context);

        difficulty = SnakeActivity.difficulty;
        obstacleAmount = SnakeActivity.obstacleAmount;

        screenWidth = size.x;
        screenHeight = size.y;

        blockSize = screenWidth / blockNrX;
        blockNrY = screenHeight / blockSize;

        holder = getHolder();
        paint = new Paint();

        snack = new Snack();
        obstacleManager = new ObstacleManager();

        thread = new Thread(this);

        endGameButton = new RectF(
                screenWidth * 1 / 6,
                screenHeight * 7 / 16,
                screenWidth * 5 / 6,
                screenHeight * 9 / 16);

        preferences = context.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);

        personalBest = preferences.getInt(PREFERENCES_BEST, 0);

        startGame();
    }

    @Override
    public void run() {
        while(isPlaying){
            update();
            draw();
            try {
                thread.sleep(difficulty.getSpeed());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    private void startGame() {
        obstacleManager.generateObstacles(obstacleAmount.getObstacleAmount(), blockNrX, blockNrY);
        snake = new Snake(SNAKE_LEN_BEGIN, blockNrX/2, blockNrY/2);
        snack.spawnSnack(blockNrX, blockNrY, snake, null, obstacleManager);
        isPlaying = true;
        score = 0;
    }


    private void eatSnack(){
        snake.snakeLength++;
        snack.spawnSnack(blockNrX, blockNrY, snake, null, obstacleManager);
        score++;
    }

    private boolean detectDeath(){
        return snake.detectDeath(blockNrX, blockNrY)
                || snake.checkObstacleCollision(obstacleManager);
    }

    private void update() {
        if(snake.X[0] == snack.X && snake.Y[0] == snack.Y){
            eatSnack();
        }
        snake.move();

        if(detectDeath()){
            isPlaying = false;
            if(score > personalBest){
                saveBest(score);
                personalBest = score;
            }
        }
    }

    private void draw() {
        if(holder.getSurface().isValid()){
            canvas = holder.lockCanvas();
            canvas.drawColor(getResources().getColor(R.color.colorPrimary));

            paint.setColor(Color.WHITE);
            paint.setTextSize(30);

            canvas.drawText("Personal best: " + personalBest, 10, 30, paint);
            canvas.drawText("Score: " + score, 10, 70, paint);

            obstacleManager.draw(canvas, blockSize, getResources().getColor(R.color.obstacleColor));

            snack.draw(canvas, blockSize, getResources().getColor(R.color.yellow));

            snake.draw(
                    canvas,
                    getResources().getColor(R.color.snakeHead1),
                    getResources().getColor(R.color.snakeTail1),
                    blockSize);

            if (!isPlaying){
                String textGameOver = "Game Over";
                String textNewGame = "Start New Game";
                paint.setTextSize(60);
                canvas.drawRect(endGameButton, paint);
                paint.setColor(Color.BLACK);
                canvas.drawText(
                        textGameOver,
                        endGameButton.centerX() - (paint.measureText(textGameOver) / 2),
                        endGameButton.centerY() - (paint.measureText(textGameOver) / 2),
                        paint);

                canvas.drawText(
                        textNewGame,
                        endGameButton.centerX() - (paint.measureText(textNewGame) / 2),
                        endGameButton.centerY(),
                        paint);
            }
            holder.unlockCanvasAndPost(canvas);
        }
    }

    public void resume() {
        isPlaying = true;
        thread = new Thread(this);
        thread.start();
    }

    public void pause() {
        isPlaying = false;
        try {
            thread.join();
        } catch (InterruptedException e) {
            //TODO error handling
            //e.printStackTrace();
        }
    }

    //get user input
    @Override
    public boolean onTouchEvent(MotionEvent event) {

        if(!isPlaying){
            if(endGameButton.contains(event.getX(), event.getY())){
                startGame();
                resume();
            }
        }

        switch (event.getAction() & MotionEvent.ACTION_MASK){
            case MotionEvent.ACTION_UP:
                if(event.getX() >= screenWidth / 2){
                    snake.updateDirectionLeft();
                } else {
                    snake.updateDirectionRight();
                }
        }
        return true;
    }

    private void saveBest(int data){
        SharedPreferences.Editor prefEditor = preferences.edit();
        prefEditor.putInt(PREFERENCES_BEST, data);
        prefEditor.commit();
    }
}
