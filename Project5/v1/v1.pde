String customInput;
String bible;
String[] input;
Character curr;
Character prev; 
ArrayList<Character> letters;
int[] bits; 

void setup() {

  customInput = "input.txt"; 
  bible = "KingJamesBible.txt";
  input = loadStrings(bible);
  letters = new ArrayList<Character>();
  for(int i = 0; i < input.length; i++) {
    input[i] = input[i].toLowerCase();
    input[i] = input[i].replaceAll("[^a-zA-Z]", "");
    for(int j = 0; j < input[i].length(); j++) {
      letters.add(input[i].charAt(j));
    }
  }
}

void draw() {
  for(int i = 1; i < letters.size() - 1; i++) {
       String temp = binary(letters.get(i-1)); 
       temp = temp.replace("00000000","");
       String temp2 = binary(letters.get(i));
       temp2 = temp2.replace("00000000","");
       println(temp + temp2);
  }

}
