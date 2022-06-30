package com.ldj.dao;

import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import org.mariadb.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TimeTests {

    @Test
    public void testNow() throws Exception {

        //mariaDB 드라이버 JVM에 등록
        Class.forName("org.mariadb.jdbc.Driver");

        //드라이버를 통해 연결
        @Cleanup Connection con = DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/mydb",
                "mydbuser",
                "mydbuser");

        //PreparedStatement 방식으로 쿼리 실행
        @Cleanup PreparedStatement pasmt =
                con.prepareStatement("select now()");
        @Cleanup ResultSet resultSet = pasmt.executeQuery();

        //index지정 //https://aricode.tistory.com/10
        resultSet.next();

        System.out.println(resultSet.getString(1));
    }
}
