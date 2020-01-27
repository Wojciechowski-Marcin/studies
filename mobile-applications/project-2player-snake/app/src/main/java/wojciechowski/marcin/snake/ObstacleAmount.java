package wojciechowski.marcin.snake;

public enum ObstacleAmount {
    None, Few, Normal, Many;

    public int getObstacleAmount(){
        switch(this){
            case Few:
                return 4;
            case Normal:
                return 8;
            case Many:
                return 12;
            default:
                return 0;
        }
    }
}
