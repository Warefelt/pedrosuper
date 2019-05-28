import java.awt.*;

public class Drawing {
    private Color[][] colors;
    private final int height;
    private final int width;
    public static final Color W = Color.WHITE;
    public static final Color B = Color.BLACK;
    public static final Color O = new Color(100,100,0);


    public Drawing(int height, int width){
        this.height = height;
        this.width = width;
        colors = new Color[height][width];
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                colors[i][j] = Color.BLACK;
            }
        }
    }

    public Drawing(Color[][] colors, int height, int width){
        this.height = height;
        this.width = width;

        this.colors = new Color[height][width];
        if(colors.length > height || colors[0].length > width){
            throw new RuntimeException("Frame too small.");
        }
        if (colors.length % 2 != height % 2 || colors[0].length % 2 != width % 2){
            throw new RuntimeException("Nah nah nah don't you try that on me man.");
        }
        if(colors.length != height || colors[0].length != width){
            for (int i = 0; i < height; i++) {
                for (int j = 0; j < width; j++) {
                    this.colors[i][j] = B;
                }
            }
        }
        int heightDifference = (height-colors.length)/2;
        int widthDifference = (width-colors[0].length)/2;
        for (int i = heightDifference; i < height-heightDifference; i++) {
            for (int j = widthDifference; j < width-widthDifference; j++) {
                this.colors[i][j] = colors[i-heightDifference][j-widthDifference];
            }
        }
    }

    public void setAColor(int i, int j, Color c){
        colors[i][j] = c;
    }

    public Color[][] getColors(){
        return colors;
    }

    public Color getColor(int row, int col){
        return colors[row][col];
    }

    public Color getModifiedColor(int row, int col){
        if (colors[row][col] == W){
            return O;                               //To distinguish old frames from the new
        }
        return colors[row][col];
    }

    public void printDrawing(){
        System.out.print("{");
        for (int i = 0; i < height; i++) {
            System.out.print("{");
            for (int j = 0; j < width; j++) {
                if(j != 0){
                    System.out.print(", ");
                }
                if(colors[i][j].equals(Color.WHITE)){
                    System.out.print("W");
                }
                else if(colors[i][j].equals(Color.BLACK)){
                    System.out.print("B");;
                }
                else {
                    System.out.print("other");
                }

            }
            System.out.println("},");
        }
        System.out.println("};");
    }
    
    public void printDrawing2(){
        System.out.print("{");
        for (int i = 0; i < ((height-1)/8)+1; i++) {        //Varje page
            System.out.print("{");
            for (int j = 0; j <width ; j++) {               //Varje adress
                if(j != 0){
                    System.out.print(", ");
                }
                System.out.print("0b");
                for (int k = 0; k < 8; k++) {               //Varje bit inom en page
                    if(colors[i*8+7-k][j].equals(W)){
                        System.out.print("1");
                    }
                    else if(colors[i*8+7-k][j].equals(B)){
                        System.out.print("0");
                    }
                    else {
                        System.out.print("X");
                    }
                }
            }
            System.out.print("}");
            if(i < ((height-1)/8))
                System.out.println(",");
        }
        System.out.println("};");
    }

    public static Color[][] Pedro_still(){
        Color[][] PedroStill = {{B, B, B, B, B, B, B, W, W, W, W, W, W, B, B, B, B, B, B, B},
                {B, B, B, B, B, W, W, W, W, W, W, W, W, W, B, B, B, B, B, B},
                {B, B, B, B, W, W, W, W, W, W, W, W, W, W, W, B, B, B, B, B},
                {B, B, B, W, W, W, W, W, W, W, W, W, W, W, W, W, B, B, B, B},
                {B, B, W, W, W, W, W, W, W, W, W, W, B, B, W, W, W, B, B, B},
                {B, W, W, W, W, W, W, W, W, W, B, B, B, B, B, B, W, W, B, B},
                {B, W, W, W, W, W, W, W, W, W, B, B, B, B, B, B, B, W, B, B},
                {B, W, W, W, W, W, W, W, W, B, B, B, B, B, B, B, B, B, W, B},
                {W, W, W, W, W, W, W, W, W, B, B, B, B, B, B, B, B, B, W, B},
                {W, W, W, W, W, W, W, B, W, B, B, B, B, B, B, B, W, W, W, B},
                {W, W, W, W, W, W, B, B, B, W, W, W, W, B, B, W, B, B, W, B},
                {W, W, W, B, W, W, B, B, W, B, B, B, B, B, B, B, B, B, B, W},
                {W, W, W, B, W, W, B, B, B, B, B, W, B, B, B, B, W, B, B, W},
                {B, W, W, B, B, B, B, B, B, B, W, W, B, B, B, W, W, B, B, W},
                {B, W, W, W, B, B, B, B, B, B, B, B, B, B, B, B, W, B, B, W},
                {B, B, W, W, B, B, W, B, B, B, B, B, B, B, B, B, B, W, B, W},
                {B, B, W, W, B, B, W, B, B, B, B, B, B, B, B, B, B, W, B, W},
                {B, B, B, W, W, B, B, W, B, B, B, B, B, B, B, W, W, B, B, W},
                {B, B, B, B, W, W, B, B, B, B, W, W, B, B, B, B, B, B, B, W},
                {B, B, B, B, B, W, B, B, B, B, W, B, W, W, W, W, B, B, W, B},
                {B, B, B, B, B, B, W, B, B, B, B, W, B, W, B, W, B, B, W, B},
                {B, B, B, B, B, B, W, W, B, B, B, B, W, W, W, B, B, B, W, B},
                {B, B, B, B, B, W, B, B, W, B, B, B, B, B, B, B, B, B, W, B},
                {B, B, B, B, W, B, B, B, B, W, W, B, B, B, B, B, B, B, W, B},
                {B, B, B, B, W, B, W, B, B, W, B, W, W, B, B, B, B, W, B, B},
                {B, B, B, W, B, W, W, B, B, B, W, B, B, W, W, W, W, B, B, B},
                {B, B, B, W, B, W, B, W, W, W, W, W, W, W, W, B, W, B, B, B},
                {B, B, B, B, W, B, W, B, B, B, W, B, B, W, B, W, B, B, B, B},
                {B, B, B, B, B, B, W, B, B, W, W, B, B, W, B, B, B, B, B, B},
                {B, B, B, B, B, B, W, W, W, B, W, W, W, W, B, B, B, B, B, B},
                {B, B, B, B, B, B, W, B, B, W, B, W, B, B, W, B, B, B, B, B},
                {B, B, B, B, B, B, B, W, W, W, B, W, W, W, W, B, B, B, B, B},};
        return PedroStill;
    }

    public static Color[][] Drawing1(){
        Color[][] bild = {{B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, W, B, W, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, W, W, W, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, W, W, W, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, W, W, W, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, W, B, B, B, B, B, W, B, B, B, B, B, W, B, B, B, B},
                {B, B, B, W, W, W, W, B, B, W, W, W, B, B, W, W, W, W, B, B, B},
                {B, B, W, W, W, W, W, W, W, W, W, W, W, W, W, W, W, W, W, B, B},
                {B, B, W, W, W, W, W, W, W, W, W, W, W, W, W, W, W, W, W, B, B},
                {B, W, W, W, W, W, W, B, W, W, W, W, W, B, W, W, W, W, W, W, B},
                {B, W, W, W, W, B, B, B, B, W, W, W, B, B, B, B, W, W, W, W, B},
                {B, W, W, B, B, B, B, B, B, W, W, W, B, B, B, B, B, B, W, W, B},
                {B, W, B, B, B, B, B, B, W, W, W, W, W, B, B, B, B, B, B, W, B},
                {B, W, B, B, B, B, B, B, W, W, W, B, W, B, B, B, B, B, B, W, B},
                {B, B, B, B, B, B, B, B, B, W, W, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, W, W, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, W, W, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, W, W, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, W, W, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, W, B, B, B, B, B, B, B, B, B, B}};
        return bild;
    }

    public static Color[][] murabito(){
        Color[][] hi = {{B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, W, W, W, W, W, W, W, W, W, B, B, B, B, B, B},
                {B, B, B, B, B, W, W, W, W, W, W, W, W, W, W, W, B, B, B, B, B},
                {B, B, B, B, W, W, B, W, W, B, W, W, B, W, W, W, W, B, B, B, B},
                {B, B, B, W, B, W, B, W, B, B, W, B, B, W, B, W, W, W, B, B, B},
                {B, B, B, W, B, B, B, B, B, B, B, B, B, B, B, W, B, W, B, B, B},
                {B, B, B, W, B, B, W, B, B, B, B, W, B, B, B, B, B, W, B, B, B},
                {B, B, B, W, B, B, W, W, B, B, B, W, W, B, B, B, B, W, B, B, B},
                {B, B, B, W, B, B, B, B, B, B, B, B, B, B, B, B, B, W, B, B, B},
                {B, B, B, B, W, B, B, B, W, B, B, B, W, B, B, B, W, B, B, B, B},
                {B, B, B, B, W, B, B, B, B, W, W, W, B, B, B, B, W, B, B, B, B},
                {B, B, B, B, B, W, B, B, B, B, B, B, B, B, W, W, B, B, W, B, B},
                {B, B, B, B, B, B, W, W, W, W, W, W, W, W, B, B, B, W, B, W, W},
                {B, B, B, B, B, W, B, B, B, B, B, B, B, B, W, B, W, B, B, B, B},
                {B, B, B, B, W, B, B, B, B, B, B, B, B, B, B, W, W, B, B, B, W},
                {B, B, B, W, B, B, B, B, W, W, W, B, B, B, W, B, W, B, B, W, W},
                {B, B, B, B, W, B, B, W, B, B, W, B, B, W, W, B, W, W, W, W, B},
                {B, B, B, W, W, W, B, B, B, W, B, B, W, W, W, W, W, W, B, B, B},
                {B, B, B, W, W, W, W, W, B, W, W, W, W, W, W, W, B, B, B, B, B},
                {B, B, B, B, W, W, W, W, W, W, W, W, B, B, B, B, B, B, B, B, B}};
        return hi;
    }

    public static Color[][] SuperPedro_TitleScteen(){
        Color[][] hi = {{B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, B, B, B, B, B, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, B, B, B, B, W, W, W, W, B, B, B, B, B, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, B, B, B, B, W, W, W, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, W, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, W, W, W, W, W, B, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, B, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, B, B, B, B, B, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, B, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, W, W, W, B, B, B, W, W, W, W, W, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, W, W, B, B, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, W, W, B, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, W, W, B, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, B, W, W, B, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, W, W, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, B, B, B, W, B, B, B, B, B, B},
                {B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, B, W, W, B, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, W, W, B, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, W, W, B, B, W, W, B, W, W, B, B, B, W, W, B, B, W, W, B, B, B, W, W, B, W, B, B, W, B, W, B, B, B, B},
                {B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, W, W, W, W, W, W, B, B, B, W, B, W, B, W, B, W, W, B, B, B, B, B},
                {B, B, W, W, W, W, W, B, B, B, B, W, W, W, W, B, B, B, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, B, B, W, W, B, B, B, B, B, B, W, W, B, B, B, B, B, B, W, W, W, W, W, W, B, B, W, W, W, W, W, B, B, B, W, W, B, B, W, W, B, B, B, W, W, W, W, B, B, B, B, B, B, B, W, W, W, W, W, B, B, B, W, W, B, B, W, W, B, B, B, W, W, W, W, B, B, W, B, W, B, B, B, W, B, W, B, W, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, W, W, W, B, W, W, W, B, W, W, W, B, W, W, W, B, W, W, W, B, B, B, B, B, W, W, W, B, W, B, B, W, B, W, B, W, B, B, B, B, B, W, B, W, B, W, W, W, B, W, B, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, W, B, W, B, W, B, B, B, W, B, W, B, W, B, B, B, W, B, B, B, B, B, B, B, W, B, W, B, W, W, B, W, B, W, B, W, B, B, B, B, B, W, B, W, B, W, B, W, B, W, B, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, W, B, W, B, W, B, B, B, W, B, B, B, B, B, W, B, B, B, W, B, B, B, B, B, W, W, W, B, W, B, W, W, B, B, W, B, B, B, B, B, B, W, W, B, B, W, W, W, B, B, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, W, W, W, B, W, B, B, B, W, W, W, B, W, W, W, B, W, W, W, B, B, B, B, B, W, B, W, B, W, B, B, W, B, B, W, B, B, B, B, B, B, W, B, W, B, W, B, W, B, B, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, W, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B},
                {B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B}};
        return hi;
    }
}
