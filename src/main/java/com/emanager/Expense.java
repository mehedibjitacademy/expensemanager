package com.emanager;
import java.sql.Date;

public class Expense {
    private String name;
    private String category;
    private String description;
    private double amount;
    private Date date;

    public Expense(String name, String category, String description, double amount, java.sql.Date date) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.amount = amount;
        this.date = date;
    }


    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getDescription() {
        return description;
    }

    public double getAmount() {
        return amount;
    }

    public Date getDate() {
        return date;
    }
}
