package wojciechowski.marcin.snake;

import android.graphics.Canvas;
import android.graphics.Paint;

import java.util.Random;

public class Snack {

    public int X;
    public int Y;

    public void spawnSnack(int blockNrX, int blockNrY, Snake snake1, Snake snake2, ObstacleManager obstacleManager) {
        Random random = new Random();
        boolean flag = true;
        while(flag){
            X = random.nextInt(blockNrX - 1) + 1;
            Y = random.nextInt(blockNrY - 1) + 1;
            flag = false;
            for(int i = 0; i < snake1.snakeLength; i++){
                if(snake1.X[i] == X) flag = true;
                if(snake1.Y[i] == Y) flag = true;
                if(snake2 != null) {
                    if(snake2.X[i] == X) flag = true;
                    if(snake2.Y[i] == Y) flag = true;
                }
                for (Obstacle obstacle : obstacleManager.obstacles)
                    for(int j = 0; j < obstacle.length; j++)
                        if(obstacle.positionX[j] == X && obstacle.positionY[j] == Y)
                            flag = true;


            }
        }
    }
    public void draw(Canvas canvas, int blockSize, int snackColor){
        Paint paint = new Paint();
        paint.setColor(snackColor);
        canvas.drawRect(
                X * blockSize,
                Y * blockSize,
                (X * blockSize) + blockSize,
                (Y * blockSize) + blockSize,
                paint
        );
    }
}
