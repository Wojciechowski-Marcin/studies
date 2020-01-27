package wojciechowski.marcin.snake;

import android.graphics.Canvas;
import android.graphics.Paint;

import java.util.Random;

public class Obstacle {
    public int[] positionX;
    public int[] positionY;
    int length;

    public Obstacle(int startingX, int startingY){
        Random random = new Random();
        length = random.nextInt(8) + 2;
        positionX = new int[length];
        positionY = new int[length];
        positionX[0] = startingX;
        positionY[0] = startingY;

        for(int i = 1; i < length; i++){
            positionX[i] = positionX[i-1];
            positionY[i] = positionY[i-1];
            while(positionX[i] == positionX[i-1] && positionY[i] == positionY[i-1]) {
                switch (pickDirection()) {
                    case UP:
                        positionY[i]--;
                        break;
                    case DOWN:
                        positionY[i]++;
                        break;
                    case LEFT:
                        positionX[i]--;
                        break;
                    case RIGHT:
                        positionX[i]++;
                        break;
                }
            }
        }
    }

    private Direction pickDirection(){
        Random random = new Random();
        return Direction.intToDirection(random.nextInt(4));
    }

    public void draw(Canvas canvas, int blockSize, int obstacleColor) {
        Paint paint = new Paint();
        paint.setColor(obstacleColor);
        for(int i = 1; i < length; i++){
            canvas.drawRect(
                    positionX[i] * blockSize,
                    positionY[i] * blockSize,
                    (positionX[i] * blockSize) + blockSize,
                    (positionY[i] * blockSize) + blockSize,
                    paint
            );
        }
    }
}
