package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class User {

    //public ArrayList<String[]> getAllTasks(String container_id) throws Exception{
    // public ArrayList<String[]> getAllTasks() throws Exception{
        // Select fromDb
        // res is the data selected
    // ArrayList<String[]> all_tasks = new ArrayList<String[]>(); ;
    //  Connection con = Uticonnexion.seConecter();
    //  ResultSet res=con.createStatement().executeQuery("select * from task");
    //  while(res.next()){
    //       String[] tmp = {String.valueOf(res.getString("description")),res.getString("titre"),res.getString("pr")};
    //     all_tasks.add(tmp);
    //
    //   }
//  return all_tasks;
    // }


    public HashMap getContainers(int user_id) throws Exception{
        ArrayList<String[]> all_containers = new ArrayList<String[]>(); // shy haja HashMap
        HashMap container_task = new HashMap();
        Connection con = Uticonnexion.seConecter();
        ResultSet res_container = con.createStatement().executeQuery("select * from task_container where user_id=" + user_id );
        while (res_container.next()){
            ArrayList<String[]> tmp = getTasksbyContainer(res_container.getInt("container_id"));
            container_task.put(res_container.getString("container_title"),tmp);
        }
        System.out.println("hihihhih");
        for (Object key : container_task.keySet()) {
            ArrayList<String> value = (ArrayList<String>) container_task.get(key);
            System.out.println("Key: " + key + ", Value: " + value);
        }
        return container_task;
    }

    public ArrayList<String[]> getTasksbyContainer(int container_id) throws Exception{
        ArrayList<String[]> task_by_container=new ArrayList<>();
        Connection con=Uticonnexion.seConecter();
        ResultSet res=con.createStatement().executeQuery("select * from task where container_id="+container_id);
        while(res.next()){
            System.out.println("éééééé");
            String[] tmp = {String.valueOf(res.getString("description")),res.getString("title"),String.valueOf(res.getString("task_id")),String.valueOf(res.getDate("dueDate"))};
            task_by_container.add(tmp);
            System.out.println(tmp[0]+" "+tmp[1]+" "+tmp[2]+" "+tmp[3]);
        }

        return task_by_container;
    }

    public void insetTask(String title_task,String desc,String title_container,int user_id,String dueDate) throws Exception {
        Connection con = Uticonnexion.seConecter();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM task_container WHERE container_title = ? and user_id=?");
        stmt.setString(1, title_container);
        stmt.setInt(2, user_id);
        ResultSet res = stmt.executeQuery();
        while (res.next()) { // Move the cursor to the first row
            int container_id = res.getInt("container_id");
            System.out.println(container_id);
            System.out.println("holiholi");

            PreparedStatement pst = con.prepareStatement("INSERT INTO task (title, description, container_id, user_id, dueDate) VALUES (?,?,?,?,?) ");
            pst.setString(1, title_task);
            pst.setString(2, desc);
            pst.setInt(3, container_id);
            pst.setInt(4, user_id);
            pst.setDate(5, Date.valueOf(dueDate));
            pst.executeUpdate();
            System.out.println("ajouuuuter");
        }
    }



       public ArrayList<String[]> getAllTasks(int user_id) throws Exception{
        // Select fromDb
        //res is the data selected
    ArrayList<String[]> all_tasks = new ArrayList<String[]>(); ;
     Connection con = Uticonnexion.seConecter();
     ResultSet res=con.createStatement().executeQuery("select * from task where user_id="+user_id);
      while(res.next()){
        String[] tmp = {String.valueOf(res.getString("description")),res.getString("title")};
           all_tasks.add(tmp);
         System.out.println(tmp[0]+" "+tmp[1]+" "+tmp[2]);
      }
      return all_tasks;
    //}
    //public ArrayList<String[]> getAllContainers() throws Exception{
        // Select fromDb
        // res is the data selected
    //ArrayList<String[]> all_containers = new ArrayList<String[]>(); ;
    // Connection con = Uticonnexion.seConecter();
    // ResultSet res=con.createStatement().executeQuery("select * from container");
    // while(res.next()){
    //    String[] tmp = {String.valueOf(res.getInt("container_id")),res.getString("container_title")};
    //  all_containers.add(tmp);
//
    //  }
    // return all_containers ;
    //}

}




}
