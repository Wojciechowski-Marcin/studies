package wojciechowski.marcin.snake;

public enum Difficulty {
    Easy, Medium, Hard;

    public int getSpeed() {
        switch(this) {
            case Easy:
                return 200;
            case Hard:
                return 75;
            default:
                return 100;

        }
    }
}
