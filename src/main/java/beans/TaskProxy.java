package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TaskProxy implements UserTask {






    boolean alert;
    @Override
    public boolean supprimer(String task_id) {

        try {

            Connection con = Uticonnexion.seConecter();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM task WHERE  task_id=?");

            stmt.setString(1, String.valueOf(task_id));
            ResultSet res = stmt.executeQuery();
            while (res.next()) {
                System.out.println("entré");
                Task task= new Task(res.getString("titre"), res.getString("pr"), res.getString("description"), res.getDate("dueDate"));
                String priority = res.getString("pr");
                if (priority.equals("HIGH")) {
                    System.out.println("supp1");
                    alert=true;
                } else {
                    System.out.println("supp2");
                    task.supprimer(task_id);
                    alert=false;
                }
            }
            return alert;


        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
	
}

