import processing.pdf.*;

float a = 0.0;
float s = 0.0;
float angle = 0.0;
            
boolean record = false;
boolean paused = false;
boolean button = false;
boolean showStroke = false;
            
color myColors;
color aiCol;
int time =0;
int aiScale = 1;
            

                        
void setup() {
   
    size(800,800);
    background(255);
    smooth();
   //set at 60fps for app, slowed for drawing
    frameRate(30);  
    beginRecord(PDF, "filename-####.pdf");   
    showStroke = false;   


}
            
void flwr (float x, float y) {
    
    noStroke();
    //fill(255,0,0); //red
    fill(aiCol);
    for (int j = 0; j < 6; j++) {
        ellipse(0, -35, 35 , 35);
        //rotate(radians(72));
        rotate(radians(60));
    }
    // centre circle
    //fill(255); //white
    fill(aiCol);
    ellipse(0, 0,35,35);
}
            
            
void draw() {
                
  int col = int(random(6));
  if (col == 0) { 
    aiCol = color (255,255,255); //white
  } 
  else if (col == 1) { aiCol = color (255,0,0); //red
  }
  else if (col == 2) { aiCol = color (255,255,255); //red
  }
  else if (col == 3) { aiCol = color (255,0,0); //red
  }
  else if (col == 4) { aiCol = color (255,255,255); //red
  }
  else if (col == 5) { aiCol = color (255,0,0); //white
  }
                
  if (record) {                 
    println("file saved");
  }
  if (record) {
    endRecord();
    record = false;
    beginRecord(PDF, "filename-####.pdf");
  }        
   a = a + 0.04;
   s = cos(a)*2;             
  //draw flower at mouseX and Y coordinates              
  translate(mouseX, mouseY);    
  scale(s + (aiScale * 0.1)); 
  flwr(0,0);
}
void keyPressed() {

      if (key == 's') {
          record = true;
          draw();
       }
       if (key == '-') {
        aiScale--;

       }
       if (key == '='){
        aiScale++;
       }
       if (key == 'c'){
        background(255);
       }

       
    }