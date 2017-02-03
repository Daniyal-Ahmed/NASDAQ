

/** 
 * @author Daniyal Ahmed
 * @since Nov 18, 2015
 * @since JDK 8
 * @version 1.0
 *
 */


import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import javax.swing.JOptionPane;
import javax.swing.JFrame;  
import java.util.*;

PFont title;
PFont body;
PImage logo;
PFont splash;

ArrayList<Stock> stocksA;
ArrayList<Dividend> divsA;
ArrayList<Stock> stocksB;
ArrayList<Dividend> divsB;
ArrayList<Stock> stocksC;
ArrayList<Dividend> divsC;

boolean callMethod1;
boolean callMethod2;
boolean inputedStockA;
boolean inputedDateA;
boolean inputedStockB;
boolean inputedDateB;
boolean inputedStockC;
boolean inputedDateC;
boolean checkA ;
boolean checkB ;
boolean checkC ;

int inputComparisons;
String inputSymbolA;
int inputDateA;
String inputSymbolB;
int inputDateB;
String inputSymbolC;
int inputDateC;

char[] symbolSplitA;
char[] symbolSplitB;
char[] symbolSplitC;

String inputSearchItem;
float valueA, valueB, valueC;
boolean start;


void setup() {

  size(1050, 700);

  title = createFont("Title2.otf", 32);
  body = createFont("Title2.otf", 18);
  splash = createFont("ACD.ttf", 50);
  logo = loadImage("logo.png");

  stocksA = new ArrayList<Stock>();

  divsA = new ArrayList<Dividend>();


  stocksB = new ArrayList<Stock>();

  divsB = new ArrayList<Dividend>();


  stocksC = new ArrayList<Stock>();

  divsC = new ArrayList<Dividend>();


  callMethod1 = true;
  callMethod2 = true;
  inputedStockA = false;
  inputedDateA = false;
  inputedStockB = false;
  inputedDateB = false;
  inputedStockC = false;
  inputedDateC = false;
  inputComparisons = 0;

  start = false;

  valueA = 0;
  valueB = 0;
  valueC = 0;

  checkA = false;
  checkB = false;
  checkC = false;
}

void draw() {

  if (start == false) {
    background(255);
    fill(0);
    textFont(splash); 
    text("WELCOME TO THE", 360, 200);
    text("NASDAQ DATABASE STOCK COMPARISON SYSTEM", 125, 300);
    text("Click to START", 400, 400);
    textSize(30);
    text("Daniyal Ahmed", 450, 600);

    image(logo, 10, 20, 400, 114);
  } else {

    if (callMethod1) {


      inputComparisons = getInt("How many stocks do you want to compare (2 or 3)?");
      if (inputComparisons == 2) {
        inputSymbolA = getString("Enter Stock Symbol for the first Stock you want to compare");
        inputDateA = getInt("Enter the Comparison Date for the first Stock (yyyymmdd)");
        symbolSplitA = inputSymbolA.toCharArray();
        stocksA =   createStocks(symbolSplitA, inputSymbolA);
        divsA = createDividends(symbolSplitA);

        inputSymbolB = getString("Enter Stock Symbol for the second Stock you want to compare");
        inputDateB = getInt("Enter the Comparison Date for the second Stock (yyyymmdd)");
        symbolSplitB = inputSymbolB.toCharArray();
        stocksB = createStocks(symbolSplitB, inputSymbolB);
        divsB = createDividends(symbolSplitB);
      }
      if (inputComparisons == 3) {
        inputSymbolA = getString("Enter Stock Symbol for the first Stock you want to compare");
        inputDateA = getInt("Enter the Comparison Date for the first Stock (yyyymmdd)");
        symbolSplitA = inputSymbolA.toCharArray();
        stocksA =   createStocks(symbolSplitA, inputSymbolA);
        divsA = createDividends(symbolSplitA);

        inputSymbolB = getString("Enter Stock Symbol for the second Stock you want to compare");
        inputDateB = getInt("Enter the Comparison Date for the second Stock (yyyymmdd)");
        symbolSplitB = inputSymbolB.toCharArray();
        stocksB = createStocks(symbolSplitB, inputSymbolB);
        divsB = createDividends(symbolSplitB);

        inputSymbolC = getString("Enter Stock Symbol for the third Stock you want to compare");
        inputDateC = getInt("Enter the Comparison Date for the third Stock (yyyymmdd)");
        symbolSplitC = inputSymbolC.toCharArray();
        stocksC = createStocks(symbolSplitC, inputSymbolC);
        divsC = createDividends(symbolSplitC);
      }
      inputSearchItem = getString("What do you want to compare? (e.g. Price Open, Price High, Volume)"); //USE THIS AFTER
      callMethod1 = false;
    }

    if (inputSymbolB != null) {
      inputedStockB = true;
    }
    if (inputSymbolC != null) {
      inputedStockC = true;
    }
    if (inputSymbolA != null) {
      inputedStockA = true;
    }

    if (callMethod2) {
      background(255);

      fill(167);

      rect(850, 600, 120, 25);
      fill(255);
      text("Restart", 865, 622);


      fill(0);
      image(logo, 10, 20, 200, 57);
      textFont(title);
      text("NASDAQ DATABASE STOCK", 260, 50);
      text("COMPARISON SYSTEM", 300, 100);
      textFont(body);
      strokeWeight(4);
      line(15, 125, 350, 125);
      line(15, 125, 15, 690);
      line(15, 690, 350, 690);
      line(350, 125, 685, 125);
      line(350, 125, 350, 690);
      line(350, 690, 685, 690);
      line(685, 125, 1020, 125);
      line(685, 125, 685, 690);
      line(685, 690, 1020, 690);
      line(1020, 125, 1020, 690);

      int caseNumber = comparisonCase(inputSearchItem);

      while (inputedStockA) {



        Stock stockA = searchForStock(stocksA, inputSymbolA, inputDateA);
        Dividend divA = searchForDividend(divsA, inputSymbolA, inputDateA);

        valueA = outputFunction(stockA, divA, inputSymbolA, inputDateA, caseNumber, 50, 250);

        checkA = true;

        inputedStockA = false;
      }
      while (inputedStockB) {


        Stock stockB = searchForStock(stocksB, inputSymbolB, inputDateB);
        Dividend divB = searchForDividend(divsB, inputSymbolB, inputDateB);

        valueB = outputFunction(stockB, divB, inputSymbolB, inputDateB, caseNumber, 400, 250);

        checkB = true;
        inputedStockB = false;
      }
      while (inputedStockC) {

        Stock stockC = searchForStock(stocksC, inputSymbolC, inputDateC); 
        Dividend divC = searchForDividend(divsC, inputSymbolC, inputDateC);

        valueC = outputFunction(stockC, divC, inputSymbolC, inputDateC, caseNumber, 730, 250);
        checkC = true;

        inputedStockC = false;
      }

      while (checkA && checkB && checkC) {

        Compare(valueA, valueB, valueC);

        checkA = false;
        checkB = false;
        checkC = false;
      }

      while (checkA == true && checkB == true && checkC == false) {

        Compare(valueA, valueB);
        checkA = false;
        checkB = false;
      }



      callMethod2 = false;
    }
  }
}


/***************************************************************************************/
/*************************** Below are all the functions *******************************/
/***************************************************************************************/

/**
 *  This is the mousePressed function. It changes the start value to true when the mouse is clicked. If the restart button is clicked, the program restarts.
 */

void mousePressed() {
  start = true;
  if (mouseX > 850 && mouseX< 970 && mouseY > 600 && mouseY < 625) {
    setup();
  }
}

/**
 * This function takes in the values for the threee stocks being compared and sets the text color according to the comparison (if the value is greater than the one
 * it's being compared with the text will be green, and if its lesser it will be red
 *
 * @param A  value for the first stock
 * @param B  value for the second stock
 * @param C  value for the third stock
 */
public void Compare(float A, float B, float C) {

  if (A > B) {

    fill(0, 255, 0);  
    text("Compared to B: " + round(A-B), 50, 500);
  }

  if ( A > C) {

    fill(0, 255, 0);  
    text("Compared to C: " + round(A-C), 50, 550);
  }

  if (B > A) {

    fill(0, 255, 0);  
    text("Compared to A: " + round(B-A), 400, 500);
  }

  if (B > C) {

    fill(0, 255, 0);  
    text("Compared to C: " + round(B-C), 400, 550);
  }

  if (C > A) {

    fill(0, 255, 0);  
    text("Compared to A: " + round(C-A), 730, 500);
  }

  if (C > B) {

    fill(0, 255, 0);  
    text("Compared to B: " + round(C-B), 730, 550);
  }

  if (A < B) {

    fill(255, 0, 0);  
    text("Compared to B: " + round(A-B), 50, 500);
  }

  if ( A < C) {

    fill(255, 0, 0);  
    text("Compared to C: " + round(A-C), 50, 550);
  }

  if (B < A) {

    fill(255, 0, 0);  
    text("Compared to A: " + round(B-A), 400, 500);
  }

  if (B < C) {

    fill(255, 0, 0);  
    text("Compared to C: " + round(B-C), 400, 550);
  }

  if (C < A) {

    fill(255, 0, 0);  
    text("Compared to A: " + round(C-A), 730, 500);
  }

  if (C < B) {

    fill(255, 0, 0);  
    text("Compared to B: " + round(C-B), 730, 550);
  }
}


/**
 * This function takes in the values for the two stocks being compared and sets the text color according to the comparison (if the value is greater than the one
 * it's being compared with the text will be green, and if its lesser it will be red
 *
 * @param A  This is the value for the first stock
 * @param B  This is the value for the second stock
 */
public void Compare(float A, float B) {

  if (A > B) {

    fill(0, 255, 0);  
    text("Compared to B: " + round(A-B), 50, 500);
    stroke(0, 255, 0);
  }

  if (B > A) {

    fill(0, 255, 0);  
    text("Compared to A: " + round(B-A), 400, 500);
  }

  if (A < B) {

    fill(255, 0, 0);  
    text("Compared to B: " + round(A-B), 50, 500);
  }

  if (B < A) {

    fill(255, 0, 0);  
    text("Compared to A: " + round(B-A), 400, 500);
  }
}

/*************************************************************************/
/************************* Creation Functions ****************************/
/*************************************************************************/



/**
 * This function creates an array of stocks with the symbol inputed by the user
 *
 * @param symbolArray  This is the symbol string broken up into a characters array
 * @param inputSymbol  This is the inputed Symbol
 * @return  This is an arraylist of stocks with the inputed symbol
 */
public ArrayList<Stock> createStocks(char[] symbolArray, String inputSymbol) {


  ArrayList<Stock> allStocks = new ArrayList<Stock>();
  ArrayList<Stock> stocks = new ArrayList<Stock>();

  try {

    Scanner scan= new Scanner(new File(dataPath("NASDAQ/NASDAQ_daily_prices_" + symbolArray[0] + ".csv")));        

    scan.nextLine();
    while (scan.hasNextLine()) {
      String s = scan.nextLine();
      String [] initialSplit = s.split(",");
      if (initialSplit.length > 1) {
        String exchange = initialSplit[0];
        String symbol = initialSplit[1];

        float priceOpen = Float.parseFloat(initialSplit[3]);
        float priceHigh = Float.parseFloat(initialSplit[4]);
        float priceLow = Float.parseFloat(initialSplit[5]);
        float priceClose = Float.parseFloat(initialSplit[6]);
        float volume = Float.parseFloat(initialSplit[7]);
        float priceAdjClose = Float.parseFloat(initialSplit[8]);

        String[] dateSplit = initialSplit[2].split("-");
        String year = (dateSplit[0]);
        String month = (dateSplit[1]);
        String day = (dateSplit[2]);

        int date = int(year+month+day);

        allStocks.add(new Stock(exchange, symbol, date, priceOpen, priceHigh, priceLow, priceClose, volume, priceAdjClose));
      }
    }
    scan.close();
  }
  catch (FileNotFoundException e) {
    e.printStackTrace();
  }
  for ( int i = 0; i < allStocks.size(); i++) {

    if ( (allStocks.get(i).symbol()).compareToIgnoreCase(inputSymbol) == 0) {
      stocks.add(allStocks.get(i));
    }
  }
  return stocks;
}


/**
 * This function creates an array of dividends whose symbol starts with the first letter of the symbolArray
 *
 * @param symbolArray  This is the symbol string broken up into a characters array
 * @return  This is an arraylist of dividends whose symbol starts with the first letter in the symbolArray
 */
public ArrayList<Dividend> createDividends(char[] symbolArray) {

  ArrayList<Dividend> divs = new ArrayList<Dividend>();

  try {
    Scanner scan= new Scanner(new File(dataPath("NASDAQ/NASDAQ_dividends_" + symbolArray[0] + ".csv")));        
    scan.nextLine();
    while (scan.hasNextLine()) {
      String s = scan.nextLine();
      String [] initialSplit = s.split(",");
      if (initialSplit.length > 1) {
        String exchange = initialSplit[0];
        String symbol = initialSplit[1];

        float dividends = Float.parseFloat(initialSplit[3]);

        String[] dateSplit = initialSplit[2].split("-");
        String year = (dateSplit[0]);
        String month = (dateSplit[1]);
        String day = (dateSplit[2]);

        int date = int(year+month+day);

        divs.add(new Dividend(exchange, symbol, date, dividends));
      }
    }
    scan.close();
  }
  catch (FileNotFoundException e) {
    e.printStackTrace();
  }

  return divs;
}

/*************************************************************************/
/************************* Process Functions *****************************/
/*************************************************************************/

/**
 * This function searches for the stock the user asked for
 *
 * @param stocks  This is the arraylist of stocks outputed by the createStocks() funtion
 * @param inputSymbol  This is the stock symbol inputed
 * @param inputDate  This is the stock date inputed
 * @return  This is the stock searched for
 */
public Stock searchForStock(ArrayList<Stock> stocks, String inputSymbol, int inputDate) {

  if (stocks.size() == 0) {
    ERROR_Stock errorStock = new ERROR_Stock();
    return errorStock;
  } else {

    ArrayList<Stock> quickedSort = new ArrayList<Stock>();
    for (Stock s : stocks) {
      quickedSort.add(s);
    }

    ArrayList<Stock> dateSort = quickSortStocks(quickedSort);

    Stock searchedStock = binarySearch(dateSort, inputDate);

    return searchedStock;
  }
}

/**
 * This function searches for the Dividend the user asked for
 *
 * @param divs  This is the arraylist of Dividends outputed by the createDividends() funtion
 * @param inputSymbol  This is the stock/dividend symbol inputed
 * @param inputDate  This is the stock/dividend date inputed
 * @return  This is the dividend searched for
 */
public Dividend searchForDividend(ArrayList<Dividend> divs, String inputSymbol, int inputDate) {


  ArrayList<Dividend> mergedSort = new ArrayList<Dividend>();
  for (Dividend d : divs) {
    mergedSort.add(d);
  }

  ArrayList<Dividend> alphaSort = mergeSort(mergedSort);


  ArrayList<Dividend> symbolSearch = linearSearch(alphaSort, inputSymbol);

  if ( symbolSearch.size() == 0) {

    ERROR_Dividend errorDiv = new ERROR_Dividend();

    return errorDiv;
  } else {

    ArrayList<Dividend> quickedSort = new ArrayList<Dividend>();
    for (Dividend d : symbolSearch) {
      quickedSort.add(d);
    }


    ArrayList<Dividend> dateSort = quickSortDividends(quickedSort);

    Dividend searchedDividend = binarySearchDividends(dateSort, inputDate); 

    return searchedDividend;
  }
}

/*************************************************************************/
/**************************** Case Function ******************************/
/*************************************************************************/


/**
 * This function determines which value of the stock is to be compared. It tries to accomodate various inputs
 *
 * @param searchTerm  This is the inputed value of the stock to be compared
 * @return  This is the case number pointing out the values to be compared
 */
public int comparisonCase(String searchTerm) {
  int caseNumber = 0;
  if ( searchTerm.compareToIgnoreCase("price open") == 0 || searchTerm.compareToIgnoreCase("priceopen") == 0) {
    caseNumber = 1;
  } else if ( searchTerm.compareToIgnoreCase("price high") == 0 || searchTerm.compareToIgnoreCase("pricehigh") == 0) {
    caseNumber = 2;
  } else if ( searchTerm.compareToIgnoreCase("price low") == 0 || searchTerm.compareToIgnoreCase("pricelow") == 0) {
    caseNumber = 3;
  } else if ( searchTerm.compareToIgnoreCase("price close") == 0 || searchTerm.compareToIgnoreCase("priceclose") == 0) {
    caseNumber = 4;
  } else if ( searchTerm.compareToIgnoreCase("volume") == 0) {
    caseNumber = 5;
  } else if ( searchTerm.compareToIgnoreCase("price adj close") == 0 || searchTerm.compareToIgnoreCase("priceadjclose") == 0 || searchTerm.compareToIgnoreCase("price adjusted close") == 0 || searchTerm.compareToIgnoreCase("priceadjustedclose") == 0 ) {
    caseNumber = 6;
  }
  return caseNumber;
}

/*************************************************************************/
/*************************** Output Function *****************************/
/*************************************************************************/


/**
 * This function outputs all the visual text on the screen
 *
 * @param stock  This is the stock outputed by the searchForStock function
 * @param div  This is the dividend outputed by the searchForDividend function
 * @param inputSymbol  This is the inputed symbol
 * @param inputDate  This is the inputed date
 * @param caseNumber  This is the caseNumber outputed by the comparisonCase function
 * @param x  This is the default x value for the text which will be outputed
 * @param y  This is the default y value for the text which will be outputed
 * @return  This is the returned value to be compared
 */
public float outputFunction(Stock stock, Dividend div, String inputSymbol, int inputDate, int caseNumber, int x, int y) {

  float value = 0;

  if ( stock instanceof ERROR_Stock) {
    text("Symbol: " + inputSymbol, x, y);
    text("Date: " + inputDate, x, y+50);
    fill(255, 0, 0);
    text("ERROR: No entry exists", x, y + 150);
    fill(0);
  } else {
    text("Symbol: " + stock.symbol(), x, y);
    text("Date: " + stock.dateFormatted(), x, y + 50);
  }


  if (div instanceof ERROR_Dividend) {
    fill(255, 0, 0);
    text("Dividend: No Dividend", x, y + 100);
    fill(0);
  } else {
    text("Dividend: " + div.dividend(), x, y +100);
  }

  if (caseNumber == 0) {
    fill(255, 0, 0);
    text("ERROR: Value not found", x - 20, y + 200);
    fill(0);
  } else if (caseNumber == 1) {
    text("Price Open: " + stock.priceOpen(), x, y +200);
    value = stock.priceOpen();
  } else if (caseNumber == 2) {
    text("Price High: " + stock.priceHigh(), x, y +200);
    value = stock.priceHigh();
  } else if (caseNumber == 3) {
    text("Price Low: " + stock.priceLow(), x, y +200);
    value = stock.priceLow();
  } else if (caseNumber == 4) {
    text("Price Close: " + stock.priceClose(), x, y +200);
    value = stock.priceClose();
  } else if (caseNumber == 5) {
    text("Volume : " + stock.volume(), x, y +200);
    value = stock.volume();
  } else if (caseNumber == 6) {
    text("Price Adj Close: " + stock.priceAdjClose(), x, y +200);
    value = stock.priceAdjClose();
  }
  return value;
}


/*************************************************************************/
/*************************** BINARY SEARCH *******************************/
/*************************************************************************/


/**
 * This is the binary search function for Stocks which searches for the stock with the specified date
 *
 * @param stocks This is the sorted stocks arraylist
 * @param searchedDate  This is the inputed searched date
 * @return  This is the stock the user asked for. If the stock doesn't exist an ERROR_Stock is returned
 */
public Stock binarySearch(ArrayList<Stock> stocks, int searchedDate) {

  ERROR_Stock errorStock = new ERROR_Stock();

  int max = stocks.size() - 1;
  int min = 0;
  int mid;


  while (min < max) {
    mid = (int) Math.floor((max + min)/2);

    if (stocks.get(mid).date() == searchedDate) {
      return stocks.get(mid);
    } else if (stocks.get(mid).date() < searchedDate) {
      min = mid + 1;
    } else {
      max = mid - 1;
    }
  }
  if (min == max && (stocks.get(min).date() == searchedDate)) {
    return stocks.get(min);
  } else {
    return errorStock;
  }
}


/**
 * This is the binary search for Dividends which searches for the dividend on the specified date
 *
 * @param divs This is the sorted divs arraylist
 * @param searchedDate  This is the searched date
 * @return  This is the Dividend the user asked for. If the Dividend doesn't exist an ERROR_Dividend is returned
 */
public Dividend binarySearchDividends(ArrayList<Dividend> divs, int searchedDate) {

  ERROR_Dividend errorDiv = new ERROR_Dividend();

  int max = divs.size() - 1;
  int min = 0;
  int mid;


  while (min < max) {
    mid = (int) Math.floor((max + min)/2);

    if (divs.get(mid).date() == searchedDate) {
      return divs.get(mid);
    } else if (divs.get(mid).date() < searchedDate) {
      min = mid + 1;
    } else {
      max = mid - 1;
    }
  }
  if (min == max && (divs.get(min).date() == searchedDate)) {
    return divs.get(min);
  } else {
    return errorDiv;
  }
}

/*************************************************************************/
/*************************** LINEAR SEARCH *******************************/
/*************************************************************************/


/**
 * This is the linear search function
 *
 * @param divs This is the sorted arraylist of dividends 
 * @param symbol  This is the inputed stock symbol for the dividend
 * @return  This is an arraylist of dividends with the searched stock symbol
 */
public ArrayList<Dividend> linearSearch(ArrayList<Dividend> divs, String symbol) {
  ArrayList<Dividend> searched = new ArrayList<Dividend>();

  for (int i = 0; i < divs.size(); i++) {

    if ( (divs.get(i).symbol()).compareToIgnoreCase(symbol) == 0) {

      searched.add(divs.get(i));
    }
  }

  return searched;
}

/*************************************************************************/
/************************* MERGE SORT HERE *******************************/
/*************************************************************************/

/**
 *  This is the dividend merge sort shell function. It follows a divide and conquer method to sort the arraylist 
 *
 * @param divs  This is the Arraylist of dividends
 * @return  This is the sorted arraylist.
 */
public ArrayList<Dividend> mergeSort(ArrayList<Dividend> divs) {

  if (divs.size() <= 1) {
    return divs;
  }
  ArrayList<Dividend> sorted = new ArrayList<Dividend>();

  ArrayList<Dividend> left = new ArrayList<Dividend>();
  ArrayList<Dividend> right = new ArrayList<Dividend>();
  int middle = (int) Math.ceil(divs.size() / 2);

  for (int i = 0; i <divs.size(); i++) {

    if (i < middle) {

      left.add(divs.get(i));
    } else {

      right.add(divs.get(i));
    }
  }
  left = mergeSort(left);
  right = mergeSort(right);

  sorted = merge(left, right);
  return sorted;
}


/**
 * This function is the inner merge sort algorithm. It sorts the left and righ array in alphabetical order. After sorting them the function merges them into one arraylist.
 *
 * @param left  This is an arraylist of all dividends before the middle outputed by the mergeSort function
 * @param right  This is an arraylist of all dividends after the middle outputed by thre mergeSort function
 * @return  This is the sorted and merged arraylist of dividends.
 */
public ArrayList<Dividend> merge(ArrayList<Dividend> left, ArrayList<Dividend> right) {

  ArrayList<Dividend> merged = new ArrayList<Dividend>();
  while (left.size() > 0 || right.size() > 0) {

    if (left.size() > 0 && right.size() > 0) {

      if ((left.get(0).symbol()).compareTo(right.get(0).symbol()) < 0) {

        merged.add(left.get(0));
        left.remove(0);
      } else {
        merged.add(right.get(0));
        right.remove(0);
      }
    } else if (left.size() > 0) {
      merged.add(left.get(0));
      left.remove(0);
    } else if (right.size() > 0) {
      merged.add(right.get(0));
      right.remove(0);
    }
  }
  return merged;
}


//*************************************************************************/
/************************* QUICK SORT HERE *******************************/
/*************************************************************************/

/**
 * This is the quick sort function. It sorts the stocks arraylist in ascending order of date
 *
 * @param stocks This is the stocks arraylist.
 * @return  This is the sorted arraylist
 */
public ArrayList<Stock> quickSortStocks(ArrayList<Stock> stocks) {

  if (stocks.size() <=  1) {
    return stocks;
  }

  int middle = (int) Math.ceil(stocks.size() / 2);
  Stock pivot = stocks.get(middle);

  ArrayList<Stock> less = new ArrayList<Stock>();
  ArrayList<Stock> greater = new ArrayList<Stock>();

  for (int i = 0; i < stocks.size(); i++) {

    if (stocks.get(i).date() <= pivot.date()) {

      if (i == middle) {
        continue;
      }
      less.add(stocks.get(i));
    } else {
      greater.add(stocks.get(i));
    }
  }
  return concatenateStocks(quickSortStocks(less), pivot, quickSortStocks(greater));
}

/**
 * This is the concatenate function which links the arraylists of Stocks after they are quick sorted.
 *
 * @param less  This is the arraylist with values less than the pivot
 * @param pivot  This is the pivot value 
 * @param greater  This is the arraylist with values greater than the pivot. 
 * @return This is the linked together arraylist.
 */
public ArrayList<Stock> concatenateStocks(ArrayList<Stock> less, Stock pivot, ArrayList<Stock> greater) {

  ArrayList<Stock> stocks = new ArrayList<Stock>();

  for (int i = 0; i <less.size(); i++) {
    stocks.add(less.get(i));
  }

  stocks.add(pivot);

  for (int i = 0; i <greater.size(); i++) {

    stocks.add(greater.get(i));
  }

  return stocks;
}


/**
 * This is the quick sort function for dividends. It sorts the dividends arraylist in ascending order of date
 *
 * @param divs  This is the arraylist of dividends
 * @return  This is the sorted list of dividends
 */
public ArrayList<Dividend> quickSortDividends(ArrayList<Dividend> divs) {

  if (divs.size() <=  1) {
    return divs;
  }

  int middle = (int) Math.ceil(divs.size() / 2);
  Dividend pivot = divs.get(middle);

  ArrayList<Dividend> less = new ArrayList<Dividend>();
  ArrayList<Dividend> greater = new ArrayList<Dividend>();

  for (int i = 0; i < divs.size(); i++) {

    if (divs.get(i).date() <= pivot.date()) {

      if (i == middle) {
        continue;
      }
      less.add(divs.get(i));
    } else {
      greater.add(divs.get(i));
    }
  }
  return concatenateDividends(quickSortDividends(less), pivot, quickSortDividends(greater));
}

/**
 * This is the concatenate function which links the arraylists of Dividends after they are quick sorted.
 *
 * @param less  This is the arraylist with values less than the pivot
 * @param pivot  This is the pivot value 
 * @param greater  This is the arraylist with values greater than the pivot. 
 * @return This is the linked together arraylist.
 */
public ArrayList<Dividend> concatenateDividends(ArrayList<Dividend> less, Dividend pivot, ArrayList<Dividend> greater) {

  ArrayList<Dividend> divs = new ArrayList<Dividend>();

  for (int i = 0; i <less.size(); i++) {
    divs.add(less.get(i));
  }

  divs.add(pivot);

  for (int i = 0; i <greater.size(); i++) {

    divs.add(greater.get(i));
  }

  return divs;
}
/**************************************************************************************/
/****************************BELOW ARE THE INPUT FUNCTIONS*****************************/
/**************************************************************************************/

/**
 * This function will assist in getting input into your program.  If nothing is entered, a null value is returned
 * 
 * @param s is the string value that shows in the dialog window which is typically guides the user into what to type into the textbox.
 * @return The input value.  If nothing is entered, then the value returned is null.
 */
public static String prompt(String s) {
  String entry = JOptionPane.showInputDialog(s);
  if (entry == null)
    return null;
  return entry;
}

/**
 * This function uses the prompt() function to return a String.
 * 
 * @param s The prompt string for the dialog window.
 * @return a string value obtained by the input
 */
public static String getString(String s) {
  return prompt(s);
}

/**
 * This function asks for an integer, and forces proper values to be entered
 * --This function uses the getString() function
 * 
 * @param s The prompt string for the dialog window.
 * @return a integer value obtained by the input
 */
public static int getInt(String s) {
  while (true) {
    int returnValue = 0;

    String in = getString(s);
    try {

      if (in.compareTo("2") == 0 || in.compareTo("3") == 0 || in.length() == 8) {
        returnValue = Integer.parseInt(in); //try to convert the value into an integer
        return returnValue;            //if successful, return the integer value
      } else {
        JOptionPane.showMessageDialog(new JFrame(), 
          "Invalid number format", 
          "Input Error!", 
          JOptionPane.ERROR_MESSAGE);
      }
    }
    catch (NumberFormatException nfe) {    //if unsuccessful, advise user to input proper values
      JOptionPane.showMessageDialog(new JFrame(), 
        "Invalid number format", 
        "Input Error!", 
        JOptionPane.ERROR_MESSAGE);
      //continue;
    }
  }
}

/**
 * This function asks for a long value, and forces proper values to be entered
 * --This function uses the getString() function
 * 
 * @param s The prompt string for the dialog window.
 * @return a long value obtained by the input
 */
public static long getLong(String s) {
  while (true) {
    long returnValue = 0;

    String in = getString(s);
    try {
      returnValue = Long.parseLong(in); //try to convert the value into an long
      return returnValue;          //if successful, return the long value
    }
    catch (NumberFormatException nfe) {    //if unsuccessful, advise user to input proper values
      JOptionPane.showMessageDialog(new JFrame(), 
        "Invalid number format", 
        "Input Error!", 
        JOptionPane.ERROR_MESSAGE);
      continue;
    }
  }
}

/**
 * This function asks for a float value, and forces proper values to be entered
 * --This function uses the getString() function
 * 
 * @param s The prompt string for the dialog window.
 * @return a float value obtained by the input
 */
public static float getFloat(String s) {
  while (true) {
    float returnValue = 0.0f;

    String in = getString(s);
    try {
      returnValue = Float.parseFloat(in); //try to convert the value into a float
      return returnValue;          //if successful, return the float value
    }
    catch (NumberFormatException nfe) {    //if unsuccessful, advise user to input proper values
      JOptionPane.showMessageDialog(new JFrame(), 
        "Invalid number format", 
        "Input Error!", 
        JOptionPane.ERROR_MESSAGE);
      continue;
    }
  }
}

/**
 * This function asks for a double value, and forces proper values to be entered
 * --This function uses the getString() function
 * 
 * @param s The prompt string for the dialog window.
 * @return a double value obtained by the input
 */
public static double getDouble(String s) {
  while (true) {
    double returnValue = 0.0;

    String in = getString(s);
    try {
      returnValue = Double.parseDouble(in); //try to convert the value into a double
      return returnValue;              //if successful, return the double value
    }
    catch (NumberFormatException nfe) {    //if unsuccessful, advise user to input proper values
      JOptionPane.showMessageDialog(new JFrame(), 
        "Invalid number format", 
        "Input Error!", 
        JOptionPane.ERROR_MESSAGE);
      continue;
    }
  }
}

/**
 * This function asks for a single character. If more than 1 is entered, it takes the 1st. 
 * If nothing is entered, then the newline character is returned.
 * --This function uses the getString() function
 * 
 * @param s The prompt string for the dialog window.
 * @return a character value obtained by the input
 */
public static char getChar(String s) {
  String entry = getString(s);
  if (entry.length() >= 1)
    return entry.charAt(0);
  else
    return '\n';
}