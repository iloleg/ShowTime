package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConProvider {

	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","showtime","password");
			}catch(Exception e)
				{
					System.out.println(e);
				}
		return con;
    }
}
