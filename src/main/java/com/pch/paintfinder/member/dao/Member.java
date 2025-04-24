package com.pch.paintfinder.member.dao;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class Member implements Serializable {
    private String id;
    private String password;
    private List<Integer> likes;

    public Member(String id, String password, List<Integer> likes) {
        this.id = id;
        this.password = password;
        this.likes = likes;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", likes=" + likes +
                '}';
    }
}
