public interface Publisher{
    void notifier();
    void attache(Subscriber s);
    void detache(Subscriber s);
}

