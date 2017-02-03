
/**
 * This Class creates an ERROR_Stock a Stock which does not exist in the database. This class inherites the Stock Class.
 * 
 * @author Daniyal Ahmed
 * @since Nov 18, 2015
 * @since JDK 8
 * @version 1.0
 *
 */


class ERROR_Stock extends Stock {


  /**
   * Constructor for an ERROR_Stock with no parameters
   */
  public ERROR_Stock() {
    super();
  }


  /**
   * Constructor for an ERROR_Stock with 9 parameters 
   *
   * @param exchange  This is the inherited exchange
   * @param symbol  This is the inherited symbol
   * @param date  This is the inherited date
   * @param priceOpen  This is the inherited priceOpen value
   * @param priceHigh  This is the inherited priceHigh value
   * @param priceLow  This is the inherited priceLow value
   * @param priceClose  This is the inherited priceClose value
   * @param volume  This is the inherited volume value
   * @param priceAdjClose  This is the inherited priceAdjClose value
   */
  public ERROR_Stock(String exchange, String symbol, int date, float priceOpen, float priceHigh, float priceLow, float priceClose, float volume, float priceAdjClose) {
    super(exchange, symbol, date, priceOpen, priceHigh, priceLow, priceClose, volume, priceAdjClose);
  }
}