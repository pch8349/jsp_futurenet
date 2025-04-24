package com.pch.jsp;

public class Movie {
    private String title;
    private String cate;
    private String author;
    private int runtime;

    public Movie(String title, String cate, String author, int runtime) {
        this.title = title;
        this.cate = cate;
        this.author = author;
        this.runtime = runtime;
    }

    public String getTitle() {
        return title;
    }

    public String getCate() {
        return cate;
    }

    public String getAuthor() {
        return author;
    }

    public int getRuntime() {
        return runtime;
    }
}
