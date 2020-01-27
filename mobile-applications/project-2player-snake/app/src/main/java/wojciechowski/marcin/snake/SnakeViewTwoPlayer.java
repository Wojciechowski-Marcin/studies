package wojciechowski.marcin.snake;

import android.content.Context;
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

class SnakeViewTwoPlayer extends SurfaceView implements Runnable{

    private Thread thread;
    private SurfaceHolder holder;
    private Canvas canvas;
    private Paint paint;

    boolean isPlaying;

    private int screenWidth;
    private int screenHeight;

    private final int SNAKE_LEN_BEGIN = 3;

    private final int FPS = 100;

    private int blockSize;
    private final int blockNrX = 40;
    private int blockNrY;

    private RectF button;

    int winner;

    private Difficulty difficulty;
    private ObstacleAmount obstacleAmount;

    Snake snake1;
    Snake snake2;
    Snack snack;
    ObstacleManager obstacleManager;

    public SnakeViewTwoPlayer(Context context, Point size) {
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

        button = new RectF(
                screenWidth * 1 / 6,
                screenHeight * 7 / 16,
                screenWidth * 5 / 6,
                screenHeight * 9 / 16);

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
        snake1 = new Snake(SNAKE_LEN_BEGIN, blockNrX/2, blockNrY/3);
        snake2 = new Snake(SNAKE_LEN_BEGIN, blockNrX/2, blockNrY*2/3);
        snack.spawnSnack(blockNrX, blockNrY, snake1, snake2, obstacleManager);
        isPlaying = true;
        snake1.score = 0;
        snake2.score = 0;
    }

    private void eatSnack(Snake snake){
        snake.snakeLength++;
        snack.spawnSnack(blockNrX, blockNrY, snake1, snake2, obstacleManager);
        snake.score++;
    }

    private boolean detectDeath(){
        boolean isDead = false;

        if(snake1.detectDeath(blockNrX, blockNrY)
                || snake1.checkSnakeCollision(snake2)
                || snake1.checkObstacleCollision(obstacleManager)){
            winner = 2;
            isDead = true;
        }
        if(snake2.detectDeath(blockNrX, blockNrY)
                || snake2.checkSnakeCollision(snake1)
                || snake2.checkObstacleCollision(obstacleManager)) {
            winner = isDead ? 0 : 1;
            isDead = true;
        }

        return isDead;
    }

    private void update() {
        if(snake1.X[0] == snack.X && snake1.Y[0] == snack.Y){
            eatSnack(snake1);
        }
        if(snake2.X[0] == snack.X && snake2.Y[0] == snack.Y){
            eatSnack(snake2);
        }
        snake1.move();
        snake2.move();

        if(detectDeath()){
            isPlaying = false;
        }
    }

    private void draw() {
        if(holder.getSurface().isValid()){
            canvas = holder.lockCanvas();
            canvas.drawColor(getResources().getColor(R.color.colorPrimary));

            paint.setColor(Color.WHITE);
            paint.setTextSize(30);

            canvas.drawText("Score 1: " + snake1.score, 10, 70, paint);
            canvas.drawText("Score 2: " + snake2.score, 10, 110, paint);

            obstacleManager.draw(canvas, blockSize, getResources().getColor(R.color.obstacleColor));

            snack.draw(canvas, blockSize, getResources().getColor(R.color.yellow));

            snake1.draw(
                    canvas,
                    getResources().getColor(R.color.snakeHead1),
                    getResources().getColor(R.color.snakeTail1),
                    blockSize);
            snake2.draw(
                    canvas,
                    getResources().getColor(R.color.snakeHead2),
                    getResources().getColor(R.color.snakeTail2),
                    blockSize);

            if (!isPlaying){
                String textGameOver = "Game Over. Winner: Player " + winner;
                String textNewGame = "Start New Game";
                paint.setTextSize(60);
                canvas.drawRect(button, paint);
                paint.setColor(Color.BLACK);
                canvas.drawText(
                        textGameOver,
                        button.centerX() - (paint.measureText(textGameOver) / 2),
                        button.centerY() - (paint.measureText(textGameOver) / 2),
                        paint);

                canvas.drawText(
                        textNewGame,
                        button.centerX() - (paint.measureText(textNewGame) / 2),
                        button.centerY(),
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
            if(button.contains(event.getX(), event.getY())){
                startGame();
                resume();
            }
        }

        if ((event.getAction() & MotionEvent.ACTION_MASK) == MotionEvent.ACTION_UP) {
            if (event.getY() >= screenHeight / 2) {
                if (event.getX() >= screenWidth / 2) {
                    snake2.updateDirectionLeft();
                } else {
                    snake2.updateDirectionRight();
                }
            } else {
                if (event.getX() >= screenWidth / 2) {
                    snake1.updateDirectionRight();
                } else {
                    snake1.updateDirectionLeft();
                }
            }
        }
        return true;
    }
}
