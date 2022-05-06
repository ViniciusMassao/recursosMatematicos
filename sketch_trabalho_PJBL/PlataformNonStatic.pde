public class PlataformNonStatic implements Plataform {
  private float x;
  private float x_original;
  private float y;
  private float w;
  private float h;
  private float angle;
  private float step = 0.3;
  
  
  PlataformNonStatic(float x, float y, float w, float h, float angle){
    this.x = x;
    this.x_original = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.angle = angle;
  }
  
  boolean update(){
    System.out.println("x = " + x);
    if (x >= x_original + 25 || x < x_original){
      step = -step; 
    }
    
    x += step;
    y += calcY(step);
    
    return true;
  };
  
  void render(){
    rect(this.x, this.y, this.w, this.h); 
  };
  
  float moviment(float dx){
    return tan(angle) * dx;
  }
  
  ArrayList<Float> getPlataformValues(){
    ArrayList<Float> returnValues = new ArrayList<>();
    returnValues.add(x);
    returnValues.add(y);
    returnValues.add(w);
    returnValues.add(h);
    
    return returnValues;
  }
  
  float calcY(float dx) {
    return tan(angle) * dx;
  }
  
  boolean movingPlataform(){
    return true; 
  }
}
