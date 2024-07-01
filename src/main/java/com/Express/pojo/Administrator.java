package com.Express.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Administrator{
    private String ID;
    private String password;
    private String telephoneNumber;
}
