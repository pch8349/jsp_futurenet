package com.pch.jsp;

public class Book {
    private String category;
    private String title;
    private String author;
    private String publisher;
    private int price;

    public Book() {
    }

    public Book(String category, String title, String author, String publisher, int price) {
        this.category = category;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return
                "카테고리:" + category + '\n' +
                "제목:" + title + '\n' +
                "작가:'" + author + '\n' +
                "출판사:" + publisher + '\n' +
                "가격:" + price +
                '}';
    }
}
