package com.pch.jsp;

public class Coffee extends Menu{
    private String bean;

    public Coffee(String name, int price, String bean) {
        super(name, price);
        this.bean = bean;
    }

    public String getBean() {
        return bean;
    }

    public void setBean(String bean) {
        this.bean = bean;
    }

    @Override
    public void printInfo() {
        System.out.print("이름=" + super.getName());
        System.out.print(" | 가격=" + super.getPrice());
        System.out.println(" | 원두=" + this.getBean());
    }
}
