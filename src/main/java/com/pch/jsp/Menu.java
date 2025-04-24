package com.pch.jsp;

public class Menu {
    private String name; // 메뉴명
    private int price; // 가격

    public Menu() {

    }

    public Menu(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void printInfo() {
        System.out.print("이름=" + name);
        System.out.println(" | 가격=" + price);
    }
}
