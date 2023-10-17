package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

public class Task implements UserTask{
    private String name;
    private String desc_task;
    private Date dueDate;
    private String title;
    private String email;

    public String getTitle() {
        return title;
    }


    public String getDesc_task() {
        return desc_task;
    }

    public void setDesc_task(String desc_task) {
        this.desc_task = desc_task;
    }




    public void setEmail(String email) {
        this.email = email;
    }

    public void setTitle(String title) {
        this.title = title;
    }



    public String getEmail() {
        return email;
    }

    public Task() {
    }

    public Task(String title, String desc_task, Date dueDate, String email) {
        this.title = title;

        this.email=email;

        this.desc_task=desc_task;
        this.dueDate=dueDate;

    }
    public Task(String title,  String desc_task, Date dueDate) {
        this.title = title;

        this.desc_task=desc_task;
        this.dueDate=dueDate;

    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }



    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public Date getDueDate() {
        return dueDate;
    }



//    @Override
//    public boolean supprimer(String task_id) {
//        try {
//            Connection con = Uticonnexion.seConecter();
//            System.out.println(task_id);
//            PreparedStatement stmt = con.prepareStatement("DELETE FROM task WHERE task_id=?");
//            stmt.setString(1, task_id);
//            stmt.executeUpdate();
//            System.out.println("suppression ok");
//            return false;
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }
    @Override
	public void supprimer(long task_id) {

        try {

            Connection con = Uticonnexion.seConecter();
            PreparedStatement stmt = con.prepareStatement("delete * FROM task WHERE task_id=?");
            stmt.executeUpdate();

                System.out.println("entré");





        } catch (Exception e) {
            throw new RuntimeException(e);
        }

 }

}

