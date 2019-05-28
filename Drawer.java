import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.HashMap;
import java.util.Map;

public class Drawer extends JFrame {
    private final Map<Position, JPanel> positionPanels = new HashMap<>();
    private static final int POSITION_SIZE = 10;

    private int height;
    private int width;

    private Drawing oldDrawing;
    private Position[][] worldMap;

    private boolean yellowRemoved;
    private boolean pressed;

    //Main method
    public static void main(String[] args){
        Drawer drawer = new Drawer(64,128);
        drawer.setVisible(true);
    }

    public Drawer(int height, int width){
        this.height = height;
        this.width = width;
        oldDrawing = new Drawing(Drawing.Pedro_still(),height,width);//Change every frame
        worldMap = new Position[height][width];
        yellowRemoved = false;
        pressed = false;

        this.setTitle("Azpa Pedro");
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        this.setSize(width*POSITION_SIZE, height*POSITION_SIZE);
        this.setResizable(false);

        // A 'main panel' that contains all other components of the GUI
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new GridLayout(height, width));
        this.add(mainPanel);

        for (int row = 0; row < height; row++) {
            for (int col = 0; col < width; col++) {
                Position position = new Position(row, col, oldDrawing.getModifiedColor(row,col));
                worldMap[row][col] = position;

                JPanel positionPanel = new JPanel();
                positionPanel.setBackground(position.getColor());

                positionPanel.addMouseListener(new MouseAdapter() {

                    @Override
                    public void mousePressed(MouseEvent e){
                        pressed = true;
                        colorAPixel(position);
                    }

                    @Override
                    public void mouseReleased(MouseEvent e) {
                        pressed = false;
                    }

                    public void mouseEntered(MouseEvent e){
                        if(pressed){
                            colorAPixel(position);
                        }
                    }
                });

                // Add the panel to the 'positionPanels' map so we can access it
                // later (with positionPanels.get(position)).
                positionPanels.put(worldMap[row][col], positionPanel);

                mainPanel.add(positionPanel);
            }
        }
        this.addKeyListener(new キー聞き());
    }

    private void colorAPixel(Position position){
        if(position.getColor().equals(Drawing.B)){
            position.setColor(Drawing.W);
            positionPanels.get(position).setBackground(position.getColor());
        }
        else if (position.getColor().equals(Drawing.W)){
            if(!yellowRemoved){
                position.setColor(oldDrawing.getModifiedColor(position.getRow(),position.getCol()));
                positionPanels.get(position).setBackground(position.getColor());
            }
            else {
                position.setColor(Drawing.B);
                positionPanels.get(position).setBackground(position.getColor());
            }
        }
        else if (position.getColor().equals(Drawing.O)){
            position.setColor(Drawing.W);
            positionPanels.get(position).setBackground(position.getColor());
        }
    }

    public void removeYellow(){
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                if (worldMap[i][j].getColor().equals(Drawing.O)){
                    worldMap[i][j].setColor(Drawing.B);
                    positionPanels.get(worldMap[i][j]).setBackground(worldMap[i][j].getColor());
                }
            }
        }
        yellowRemoved = true;
    }
    public void makeYellowWhiteAgain(){
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                if (worldMap[i][j].getColor().equals(Drawing.O)){
                    worldMap[i][j].setColor(Drawing.W);
                    positionPanels.get(worldMap[i][j]).setBackground(worldMap[i][j].getColor());
                }
            }
        }
    }

    public void saveDrawing(){
        Drawing drawing = new Drawing(height,width);
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                if(worldMap[i][j].getColor() == Drawing.O){
                    drawing.setAColor(i,j,Drawing.W);
                }
                else {
                    drawing.setAColor(i,j,worldMap[i][j].getColor());
                }
            }
        }
        drawing.printDrawing2();
        drawing.printDrawing();
    }

    class キー聞き implements KeyListener {
        @Override
        public void keyTyped(KeyEvent e){
        }

        @Override
        public void keyPressed(KeyEvent e){
            if(e.getKeyCode() == KeyEvent.VK_DOWN){
                saveDrawing();
            }
            if(e.getKeyCode() == KeyEvent.VK_LEFT){
                removeYellow();
            }
            if(e.getKeyCode() == KeyEvent.VK_RIGHT){
                makeYellowWhiteAgain();
            }
        }

        @Override
        public void keyReleased(KeyEvent e){
        }
    }

}
