package wojciechowski.marcin.snake;

import android.graphics.Canvas;
import android.graphics.Paint;

public class Snake {
    public Direction direction;
    public int[] X;
    public int[] Y;
    public int snakeLength;
    public int score;

    Snake(int startingLength, int startingPosX, int startingPosY) {
        X = new int [200];
        Y = new int [200];
        snakeLength = startingLength;
        direction = Direction.LEFT;

        for(int i = 0; i < startingLength; i++){
            X[i] = startingPosX;
            Y[i] = startingPosY;
        }
    }

    public void updateDirectionRight(){
        switch (direction){
            case UP:
                direction = Direction.LEFT;
                break;
            case DOWN:
                direction = Direction.RIGHT;
                break;
            case LEFT:
                direction = Direction.DOWN;
                break;
            case RIGHT:
                direction = Direction.UP;
                break;
            default:
                break;
        }
    }

    public void updateDirectionLeft(){
        switch (direction){
            case UP:
                direction = Direction.RIGHT;
                break;
            case DOWN:
                direction = Direction.LEFT;
                break;
            case LEFT:
                direction = Direction.UP;
                break;
            case RIGHT:
                direction = Direction.DOWN;
                break;
            default:
                break;
        }
    }
    
    public void move() {
        for(int i = snakeLength; i > 0; i--){
            X[i] = X[i - 1];
            Y[i] = Y[i - 1];
        }
        switch (direction){
            case UP:
                Y[0]--;
                break;
            case DOWN:
                Y[0]++;
                break;
            case LEFT:
                X[0]--;
                break;
            case RIGHT:
                X[0]++;
                break;
            default:
                break;
        }
    }
    
    public void draw(Canvas canvas, int colorHead, int colorTail, int blockSize) {
        Paint paint = new Paint();
        paint.setColor(colorHead);
        canvas.drawRect(
                X[0] * blockSize,
                Y[0] * blockSize,
                (X[0] * blockSize) + blockSize,
                (Y[0] * blockSize) + blockSize,
                paint
        );

        paint.setColor(colorTail);
        for(int i = 1; i < snakeLength; i++)
            canvas.drawRect(
                    X[i] * blockSize,
                    Y[i] * blockSize,
                    (X[i] * blockSize) + blockSize,
                    (Y[i] * blockSize) + blockSize,
                    paint
            );
    }
    
    public boolean detectDeath(int blockNrX, int blockNrY) {
        boolean isDead = false;
        if(X[0] == -1)         isDead = true;
        if(X[0] == blockNrX)   isDead = true;
        if(Y[0] == -1)         isDead = true;
        if(Y[0] == blockNrY)   isDead = true;

        for (int i = snakeLength - 1; i > 0; i--)
            if(X[0] == X[i] && Y[0] == Y[i])
                isDead = true;

        return isDead;
    }

    public boolean checkSnakeCollision(Snake snake2) {
        boolean isDead = false;

        for (int i = snake2.snakeLength - 1; i >= 0; i--)
            if(X[0] == snake2.X[i] && Y[0] == snake2.Y[i])
                isDead = true;

        return isDead;
    }

    public boolean checkObstacleCollision(ObstacleManager obstacleManager){
        boolean isDead = false;

        for (Obstacle obstacle: obstacleManager.obstacles)
            for(int i = 0; i < obstacle.length; i++)
                if(X[0] == obstacle.positionX[i] && Y[0] == obstacle.positionY[i])
                    isDead = true;

        return isDead;
    }
}
