package com.fc.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//有参无参
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private int adminID;
    private String adminName;
    private String adminPwd;
}
