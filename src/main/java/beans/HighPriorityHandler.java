package beans;

public class HighPriorityHandler implements Handler {
    private Handler nextHandler;

    @Override
    public void setNextHandler(Handler nextHandler) {
        this.nextHandler = nextHandler;
    }

    @Override
	public String handle(String priority) {
        String color = null;
        if (priority.equals("HIGH")) {
            // Traiter la tâche avec une priorité élevée
            color ="<span>\n" +
                    "        <span class=\"highligh\" style=\"background-color: red !important;\">\n" +
                    "            <i class=\"bi bi-exclamation-lg\"></i>\n" +
                    "            <span style=\"font-weight: bolder; margin-bottom: -2px; margin-left: -4px;\"> Importance : Elevée</span>\n" +
                    "        </span>\n" +
                    "        </span> ";
            return color;

        } else {
            // Passer la tâche au prochain objet responsable
            return nextHandler.handle(priority);
        }

    }
}