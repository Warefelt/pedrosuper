import java.awt.*;

public class Position {
    private final int row;
    private final int col;
    private Color color;

    public Position(int row, int col, Color c){
        this.row = row;
        this.col = col;
        color = c;
    }

    public void setColor(Color color){
        this.color = color;
    }

    public Color getColor(){
        return color;
    }

    public int getRow() {
        return row;
    }

    public int getCol() {
        return col;
    }
}
