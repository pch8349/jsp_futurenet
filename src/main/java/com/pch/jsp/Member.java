package com.pch.jsp;

public class Member {
    private String name;
    private int age;
    private float height;
    private char gender;
    private boolean married;

    public Member(String name, int age, float height, char gender, boolean married) {
        this.name = name;
        this.age = age;
        this.height = height;
        this.gender = gender;
        this.married = married;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public boolean isMarried() {
        return married;
    }

    public void setMarried(boolean married) {
        this.married = married;
    }
}
