package com.pch.paintfinder.paint.dao;

import lombok.Getter;
import lombok.Setter;
import com.pch.paintfinder.common.code.PaintColorCode;

import java.io.Serializable;

@Getter
@Setter
public class Paint implements Serializable {
    private int id;
    private String name;
    private String brand;
    private PaintColorCode color;
    private String img;

    public Paint(int id, String name, String brand, PaintColorCode color, String img) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.color = color;
        this.img = img;
    }

    public void printInfo(){
        System.out.println("id: "+id+" | 브랜드: "+brand+" | 이름: "+name+" | 색: "+color);
    }
}
