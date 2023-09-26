package beans;

import beans.Handler;

public class LowPriorityHandler implements Handler {
    private Handler nextHandler;
    @Override
    public void setNextHandler(Handler nextHandler) {
        this.nextHandler = nextHandler;
    }

    public String handle(String priority) {
        String color=null;
        if (priority.equals("LOW")) {
            // Traiter la tâche avec une priorité élevée
            color="<span>\n" +
                    "        <span class=\"highligh\" style=\"background-color: green !important;\">\n" +
                    "            <i class=\"bi bi-exclamation-lg\"></i>\n" +
                    "            <span style=\"font-weight: bolder; margin-bottom: -2px; margin-left: -4px;\"> Importance : Faible</span>\n" +
                    "        </span>\n" +
                    "        </span> ";;
            return color;
        }
        else{
           return nextHandler.handle(priority);
        }

    }
}
