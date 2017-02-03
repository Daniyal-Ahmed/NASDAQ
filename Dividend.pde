
/**
 * This class creates a Dividend
 * 
 * @author Daniyal Ahmed
 * @since Nov 18, 2015
 * @since JDK 8
 * @version 1.0
 *
 */

class Dividend implements NASDAQ_Item {


  public String exchange;
  public String symbol;
  public int date;
  public float dividend;

  /**
   * Constructor for Dividend with no parameters
   */
  public Dividend() {

    exchange = null;
    symbol = null;
    date = 0;
    dividend = 0;
  }

  /**
   *Constructor for dividend with 4 parameters
   *
   * @param exchange This is the exchange the Dividend is registered on (i.e. NASDAQ)
   * @param symbol  This is the ticker symbol of the stock whose dividend this is
   * @param date  This is the date the dividend issue
   * @param dividend this is the monetary value of the dividend
   */
  public Dividend(String exchange, String symbol, int date, float dividend) {

    this.exchange = exchange;
    this.symbol = symbol;
    this.date = date;
    this.dividend = dividend;
  }
  /**
   * This function returns the exchange
   * @return the string with the exchange name
   */
  public String exchange() {
    return exchange;
  }
  /**
   * This function returns the ticker symbol
   * @return the string with the symbol
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
   * This function returns the dividend
   * @return  the monetary value of the dividend
   */
  public float dividend() {
    return dividend;
  }

    
}