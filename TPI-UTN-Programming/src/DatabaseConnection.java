import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    public DatabaseConnection() {
    }

    private static final String URL = "jdbc:mysql://localhost:3306/Gym_Database";
    private static final String USER = "tuUsuario";
    private static final String PASSWORD = "tuContraseña";

    private static Connection connection = null;

    public Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("La conexión fue exitosa!");

        } else {
            connection = null;
            System.out.println("Algo ha salido mal");
        }
        return connection;
    }

    public void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}