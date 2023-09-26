package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class Task implements UserTask{
    private String name;
    private String priority;
    private String desc_task;
    private Date dueDate;
    private String title;
    private String email;

    public String getTitle() {
        return title;
    }

    public void setPriority(String priority) {
        this.priority = priority;
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

    public Task(String title, String priority, String desc_task, Date dueDate, String email) {
        this.title = title;
        this.priority = priority;
        this.email=email;

        this.desc_task=desc_task;
        this.dueDate=dueDate;

    }
    public Task(String title, String priority, String desc_task, Date dueDate) {
        this.title = title;
        this.priority = priority;
        this.desc_task=desc_task;
        this.dueDate=dueDate;

    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getPriority() {
        return priority;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public Date getDueDate() {
        return dueDate;
    }



    @Override
    public boolean supprimer(String task_id) {
        try {
            Connection con = Uticonnexion.seConecter();
            System.out.println(task_id);
            PreparedStatement stmt = con.prepareStatement("DELETE FROM task WHERE task_id=?");
            stmt.setString(1, task_id);
            stmt.executeUpdate();
            System.out.println("suppression ok");
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


}

