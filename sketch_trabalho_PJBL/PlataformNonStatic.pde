public class PlataformNonStatic implements Plataform {
  private float x;
  private float y;
  private float w;
  private float h;
  private float angle;
  
  
  PlataformNonStatic(float x, float y, float w, float h, float angle){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.angle = angle;
  }
  
  boolean update(){
    return true;
  };
  
  void render(){
    rect(this.x, this.y, this.w, this.h); 
  };
  
  float moviment(float dx){
    return tan(angle) * dx;
  }
}
