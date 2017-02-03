
/**
 * This Class creates an ERROR_Dividend, a Dividend which does not exist in the database. This class inherites the Dividend Class.
 * 
 * @author Daniyal Ahmed
 * @since Nov 18, 2015
 * @since JDK 8
 * @version 1.0
 *
 */

class ERROR_Dividend extends Dividend {

  /**
   * Constructor for an ERROR_Dividend with no parameters
   */
  public ERROR_Dividend() {

    super();
  }
  /**
   *Constructor for an ERROR_Dividend with 4 parameters 
   *
   * @param exchange  This is the inherited exchange
   * @param symbol  This is the inherited Symbol
   * @param date  This is the inherited Date
   * @param dividend  THis is the inherited dividend value
   */
  public ERROR_Dividend(String exchange, String symbol, int date, float dividend) {

    super(exchange, symbol, date, dividend);
  }
}