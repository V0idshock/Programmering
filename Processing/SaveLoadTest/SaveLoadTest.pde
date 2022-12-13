String language = "en_us";
JSONObject translation;
JSONObject huh;

void setup() {
  size(500,500);
  huh = new JSONObject();
  saveJSONObject(huh, "assets/lang/new/lol.json");
  translation = loadJSONObject("assets/lang/"+language+".json");
  selectInput("Select a file to process:", "fileSelected");
}

void draw() {
 circle(mouseX,0,200); 
 text(textTranslation("language"), width/2, height/2);
}





String textTranslation(String textid) {
  if(translation != null) { return(translation.getString(textid)); }
  else { return(textid); }
}


void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}
