package wojciechowski.marcin.snake;

import android.graphics.Canvas;

import java.util.ArrayList;

public class ObstacleManager {
    public ArrayList<Obstacle> obstacles;

    public void generateObstacles(int amount, int blockNrX, int blockNrY){
        obstacles = new ArrayList<>();
        for(int i = 0; i < amount/2; i++){
            for(int j = 0; j < amount/2; j++){
                obstacles.add(
                        new Obstacle(
                                blockNrX*(i+1)/amount*2,
                                blockNrY*(j+1)/amount*2));
            }
        }
    }

    public void draw(Canvas canvas, int blockSize, int obstacleColor) {
        for (Obstacle obstacle : obstacles) {
            obstacle.draw(canvas, blockSize, obstacleColor);
        }
    }

}
