
/**
 * This class creates a Stock
 * 
 * @author Daniyal Ahmed
 * @since Nov 18, 2015
 * @since JDK 8
 * @version 1.0
 *
 */

class Stock implements NASDAQ_Item {

  public String exchange;
  public String symbol;
  public int date;
  public float priceOpen;
  public float priceHigh;
  public float priceLow;
  public float priceClose;
  public float volume;
  public float priceAdjClose;


  /**
   * Constructor for Stock with no parameters
   */
  public Stock() {
    exchange = null;
    symbol = null;
    date = 0;
    priceOpen = 0;
    priceHigh = 0;
    priceLow = 0;
    priceClose = 0;
    volume = 0;
    priceAdjClose = 0;
  }
  /**
   * Constructor for stock with 9 parameters
   *
   * @param exchange  This is the exchange the Stock is registered in
   * @param symbol  This is the ticker symbol for the Stock
   * @param date  This is the date when the following data for the stock was recorded
   * @param priceOpen  This is the priceOpen value
   * @param priceHigh  This is the priceHigh value
   * @param priceLow  This is the priceLow value
   * @param priceClose  This is the priceClose value
   * @param volume  This is the volume
   * @param priceAdjClose  This is the priceAdjClose value
   */
  public Stock(String exchange, String symbol, int date, float priceOpen, float priceHigh, float priceLow, float priceClose, float volume, float priceAdjClose) {

    this.exchange = exchange;
    this.symbol = symbol;
    this.date = date;
    this.priceOpen = priceOpen;
    this.priceHigh = priceHigh;
    this.priceLow = priceLow;
    this.priceClose = priceClose;
    this.volume = volume;
    this.priceAdjClose = priceAdjClose;
  }
  /**
   * This function returns the exchange
   * @return  String with exchange
   */
  public String exchange() {
    return exchange;
  }
  /**
   * This function returns the symbol
   * @return  String with the Symbol
   */
  public String symbol() {
    return symbol;
  }
  /**
   * This function returns the date
   * @return  the date as an integer
   */
  public int date() {
    return date;
  }
  /**
   * This function returns the priceOpen value
   * @return  The priceOpen Value
   */
  public float priceOpen() {
    return priceOpen;
  }
  /**
   * This function returns the priceHigh value
   * @return the priceHigh value
   */
  public float priceHigh() {
    return priceHigh;
  }
  /**
   * This function returns the priceLow value
   * @return  The priceLow value
   */
  public float priceLow() {
    return priceLow;
  }
  /**
   * This function returns the priceClose value
   * @return the priceClose value
   */
  public float priceClose() {
    return priceClose;
  }
  /**
   * This function returns the volume
   * @return the volume
   */
  public float volume() {
    return volume;
  }
  /**
   * This function returns the priceAdjClose value
   * @return  the priceAdjClose value
   */
  public float priceAdjClose() {
    return priceAdjClose;
  }
  /**
   * This function formats the date to match "mm-dd-yyyy"
   * @return the formated date as a String
   */
  public String dateFormatted() {


    String dateString = str(date);

    char[] split = dateString.toCharArray();

    if ( split.length == 8) {
      //String dateFormatted= str(split[0]) + str(split[1]) + str(split[2]) + str(split[3]) + " - " + str(split[4]) + str(split[5]) + " - " + str(split[6]) + str(split[7]);   
      String dateFormatted = str(split[4]) + str(split[5]) + " - " + str(split[6]) + str(split[7]) + " - " + str(split[0]) + str(split[1]) + str(split[2]) + str(split[3]);
      return dateFormatted;
    } else {
      return dateString;
    }
  }
}