package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Uticonnexion {
    public static Connection seConecter() throws Exception{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/tododb","root","");
        }catch(ClassNotFoundException ex ){
            throw new Exception("impossible de charger le driver");
        }catch (SQLException e){
            throw new Exception("erreur"+e.getMessage());
        }
    }
}
