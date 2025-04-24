package com.pch.paintfinder.palette.dao;

import lombok.Getter;
import lombok.Setter;
import com.pch.paintfinder.paint.dao.Paint;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class Palette implements Serializable {
    private int id;
    private String memberId;
    // 이미지가 저장되어 있는 경로명
    private String imgUrl;
    private String name;
    private int like;
    private List<Paint> paints;

    public Palette(int id, String memberId, String name, String imgUrl, List<Paint> paints) {
        this.id = id;
        this.memberId = memberId;
        this.name = name;
        this.imgUrl = imgUrl;
        this.like = 0;
        this.paints = paints;
    }

    public Palette(int id, String memberId) {
        this.id = id;
        this.memberId = memberId;
    }

    public void printInfo(){
        System.out.print("id: "+id+",memberId: "+memberId+", imgUrl: "+imgUrl+",제목: "+name+",좋아요 개수: "+like+", paints: [");
        for(Paint paint : paints){
            System.out.print("{"+paint.getId()+", "+paint.getName()+"},");
        }
        System.out.print("]\n");
    }
}
