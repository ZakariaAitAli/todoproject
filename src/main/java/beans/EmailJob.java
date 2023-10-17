package beans;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EmailJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        // Placez ici la logique pour vérifier les tâches à échéance proche et envoyer des e-mails.
        // Vous devrez accéder à votre système de stockage (base de données, fichiers, etc.) pour obtenir les informations des tâches.

        // Exemple de pseudo-code pour la logique :
        // 1. Obtenez la date actuelle.
        // 2. Parcourez les tâches dans votre système de stockage.
        // 3. Pour chaque tâche, comparez la date d'échéance avec la date actuelle.
        // 4. Si la date d'échéance est proche (par exemple, dans les prochains 2 jours), envoyez un e-mail de rappel à l'utilisateur.

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();

        // Exemple : supposez que vous ayez une liste de tâches à traiter depuis votre système de stockage
        // List<Task> tasks = yourTaskRepository.getTasks();

        // Parcourez les tâches pour vérifier si la date d'échéance est proche
        for (Task task : tasks) {
            Date dueDate = task.getDueDate();
            long timeDifference = dueDate.getTime() - currentDate.getTime();

            // Définissez une limite (par exemple, 48 heures) pour laquelle vous souhaitez envoyer un rappel
            long timeThreshold = 48 * 60 * 60 * 1000; // 48 heures en millisecondes

            if (timeDifference > 0 && timeDifference <= timeThreshold) {
                // La date d'échéance est proche, envoyez un e-mail de rappel à l'utilisateur
                String to = task.getUserEmail();
                String subject = "Rappel : Date d'échéance approche";
                String body = "La date d'échéance de votre tâche approche : " + task.getDescription();

                // Utilisez la classe EmailSender pour envoyer l'e-mail
                EmailSender emailSender = new EmailSender();
                emailSender.sendEmail(to, subject, body);
            }
        }
    }
}
