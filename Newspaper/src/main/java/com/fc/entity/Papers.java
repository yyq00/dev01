package com.fc.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//有参无参
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Papers {
    private int paperID;
    private String paperName;
    private int paperCounts;
    private String detail;

    }
