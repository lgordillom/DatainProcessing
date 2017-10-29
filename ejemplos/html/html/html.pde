String runningtime;
PImage poster;



void setup() {
  size(300, 350);
  loadData();
}

void draw() {
  // Display all the stuff I want to display
  background(255);
 // image(poster, 10, 10, 164, 250);
  fill(0);
  text("Shaun the Sheep", 10, 300);
  text(runningtime, 10, 320);
}

void loadData() {
  String url = "view-source:http://www.imdb.com/title/tt2872750/";

  // Get the raw HTML source into an array of strings (each line is one element in the array).
  // The next step is to turn array into one long string with join().
  String[] lines = loadStrings(url);
  String html = join(lines, "");

  String start = "";
  String end = "";
  runningtime = giveMeTextBetween(html, start, end);

  start = "";
  // Search for the URL of the poster image.
  String imgUrl = giveMeTextBetween(html, start, end);
  // Now, load that image!
  poster = loadImage(imgUrl);
}

String giveMeTextBetween(String s, String before, String after) {

  // This function returns a substring between two substrings (before and after).
  //  If it can’t find anything it returns an empty string.
  String found = "";

  // Find the index of before
  int start = s.indexOf(before);     
  if (start == -1) {
    return "";                       
  }    

  // Move to the end of the beginning tag
  // and find the index of the "after" String      
  start += before.length();    
  int end = s.indexOf(after, start); 
  if (end == -1) {
    return "";                       
  }

  // Return the text in between
  return s.substring(start, end); 
}