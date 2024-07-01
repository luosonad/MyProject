package com.Express.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Express {
    String number;    //订单编号
    String name;   //商品姓名
    String pieces;   //商品价格
    String senderName;  //发送人姓名
    String senderTele;  //发送人电话号码
    String reciAcc;     //收件人账号
    String reciName;   //收件人姓名
    String reciTele;   //收件人电话
    String reciArea;   //收件人地址
}
