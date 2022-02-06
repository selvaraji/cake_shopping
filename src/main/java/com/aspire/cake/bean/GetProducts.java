package com.aspire.cake.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.aspire.cake.database.LoginDao;

public class GetProducts {

	public ResultSet products()
	{
		LoginDao loginDao = new LoginDao();
		loginDao.loadDriver(loginDao.databaseDriver);
		String query = "SELECT * FROM PRODUCT ";
		Connection connection = loginDao.getConnection();
		ResultSet resultSet = null;
		try {
			Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
			resultSet = statement.executeQuery(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	
}
