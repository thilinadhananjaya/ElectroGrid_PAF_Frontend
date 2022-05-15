package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Complaint {
	public Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electrogrid", "root", "");
			// For testing
			System.out.print("Successfully connected");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;

	}

	// insert method
	public String insertComplaints(String ComplaintName, String Date, String ComplaintDetails, String ComplaintCategory) {
		Connection con = connect();
		String output = "";
		if (con == null) {
			return "Error while connecting to the database";
		}

		// create a prepared statement
		String query = " insert into complaint (`ComplaintId`,`ComplaintName`,`Date`,`ComplaintDetails`,`ComplaintCategory`)"
				+ " values (?, ?, ?, ?, ?)";
		PreparedStatement preparedStmt;
		try {
			preparedStmt = con.prepareStatement(query);

			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, ComplaintName);
			preparedStmt.setString(3, Date);
			preparedStmt.setString(4, ComplaintDetails);
			preparedStmt.setString(5, ComplaintCategory);

			preparedStmt.execute();
			con.close();
			output = "Inserted successfully";

		} catch (SQLException e) {
			output = "Error while inserting";
			System.err.println(e.getMessage());
		}

		return output;
	}

	public String readComplaints() {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Complaint Id</th>"+"<th>Complaint Name</th><th>Complaint Date</th>" + "<th>Complaint Deatils</th>"
					+ "<th>Complaint Category</th></tr>";

			String query = "select * from complaint";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {
				String ComplaintId = Integer.toString(rs.getInt("ComplaintId"));
				String ComplaintName = rs.getString("ComplaintName");
				String Date = rs.getString("Date");
				String ComplaintDetails = rs.getString("ComplaintDetails");
				String ComplaintCategory = rs.getString("ComplaintCategory");

				// Add into the html table
				output += "<tr><td>" + ComplaintId + "</td>";
				output += "<td>" + ComplaintName + "</td>";
				output += "<td>" + Date + "</td>";
				output += "<td>" + ComplaintDetails + "</td>";
				output += "<td>" + ComplaintCategory + "</td>";

			}
			con.close();

			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the ComplaintS.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String updateComplaints(String ComplaintId, String ComplaintName, String Date, String ComplaintDetails, String ComplaintCategory)

	{
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement

			String query = " update complaint set ComplaintName= ? , Date = ? , ComplaintDetails = ? , ComplaintCategory = ?  where ComplaintId = ? ";

			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, ComplaintName);
			preparedStmt.setString(2, Date);
			preparedStmt.setString(3, ComplaintDetails);
			preparedStmt.setString(4, ComplaintCategory);
			preparedStmt.setInt(5, Integer.parseInt(ComplaintId));

			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Updated successfully";
		} catch (Exception e) {
			output = "Error while updating the Complaints.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String deleteComplaints(String ComplaintId) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from complaint where ComplaintId=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(ComplaintId));
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Deleted successfully";
		} catch (Exception e) {
			output = "Error while deleting the Complaints.";
			System.err.println(e.getMessage());
		}
		return output;
	}


}
