package com.emanager;

import java.sql.*;

public class DataBaseHandler {
    private final String url = "jdbc:mysql://localhost:3306";
    private final String username = "root";
    private final String password = "";
    private final Connection con;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public DataBaseHandler() {
        con = getConnection();
        if (con != null) {
            System.out.println("Database Connected: " + con.toString());
            if (initialize()) {
                System.out.println("Database initialized!");
            } else {
                System.out.println("Failed to initialize database!");
            }
        }
    }

    private boolean initialize() {
        Statement stm = null;
        try {
            stm = con.createStatement();
            stm.executeUpdate("CREATE DATABASE IF NOT EXISTS `expensemanager`");
            con.setCatalog("expensemanager");
            stm = con.createStatement();
            stm.executeUpdate("CREATE TABLE IF NOT EXISTS `expense` (" +
                    "  `id` int(11) NOT NULL AUTO_INCREMENT," +
                    "  `name` varchar(25) NOT NULL," +
                    "  `category` varchar(25) NOT NULL," +
                    "  `description` varchar(200) NOT NULL," +
                    "  `amount` double NOT NULL," +
                    "  `date` date NOT NULL," +
                    "  PRIMARY KEY (`id`)" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;");
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Connection getConnection() {
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet getExpenses() {
        ResultSet resultSet;
        try {
            Statement statement = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            String query = "SELECT * FROM expense ORDER BY date DESC";
            resultSet = statement.executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultSet;
    }

    public boolean addExpense(Expense expense) {
        try {
            PreparedStatement statement = con.prepareStatement("INSERT INTO expense VALUES(null,?,?,?,?,?)");

            statement.setString(1, expense.getName());
            statement.setString(2, expense.getCategory());
            statement.setString(3, expense.getDescription());
            statement.setDouble(4, expense.getAmount());
            statement.setDate(5, expense.getDate());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
