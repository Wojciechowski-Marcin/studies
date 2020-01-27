package wojciechowski.marcin.snake;

public enum Direction {
    UP, DOWN, LEFT, RIGHT, NONE;

    public static Direction intToDirection(int number){
        switch(number){
            case 0:
                return UP;
            case 1:
                return LEFT;
            case 2:
                return RIGHT;
            case 3:
                return DOWN;
            default:
                return NONE;
        }
    }
}
