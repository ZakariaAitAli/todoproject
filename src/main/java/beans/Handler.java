package beans;

public interface Handler {

    public void setNextHandler(Handler nextHandler);
    public abstract String handle(String priority);
}
