public class PlataformStatic implements Plataform {
  private float x;
  private float y;
  private float w;
  private float h;
  
  PlataformStatic(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  boolean update(){
    return true;
  };
  
  void render(){
    rect(this.x, this.y, this.w, this.h); 
  };
}
