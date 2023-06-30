
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/homework_2"; // URL базы данных
        String username = "root"; // Имя пользователя
        String password = "21071986"; // Пароль пользователя

        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connected successfully");

            // Создание таблицы
            String createQuery = "CREATE TABLE IF NOT EXISTS users (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT," +
                    "firstname VARCHAR(45)" +
                    ")";
            Statement createStatement = connection.createStatement();
            createStatement.execute(createQuery);
            System.out.println("Table created successfully");

            // Вставка данных
            String insertQuery = "INSERT INTO users (firstname) VALUES ('Алина'), ('Test')";
            Statement insertStatement = connection.createStatement();
            insertStatement.executeUpdate(insertQuery);
            System.out.println("Insert successfully");

            // Обновление данных
            String updateQuery = "UPDATE users SET firstname = 'Mikle' WHERE id = 4";
            Statement updateStatement = connection.createStatement();
            updateStatement.executeUpdate(updateQuery);

            // Удаление данных
            String deleteQuery = "DELETE FROM users WHERE id = 2";
            Statement deleteStatement = connection.createStatement();
            deleteStatement.executeUpdate(deleteQuery);

            // Выборка данных
            String selectQuery = "SELECT * FROM users";
            Statement selectStatement = connection.createStatement();
            ResultSet resultSet = selectStatement.executeQuery(selectQuery);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstname = resultSet.getString("firstname");
                System.out.println("ID: " + id + ", Firstname: " + firstname);
            }

            connection.close();
        } catch (SQLException e) {
            System.out.println("Disconnected");
            e.printStackTrace();
        }
    }
}
