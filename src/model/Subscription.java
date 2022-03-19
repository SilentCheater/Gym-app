package model;

public class Subscription {
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Subscription.subscription getSubscription() {
        return subscription;
    }

    public void setSubscription(Subscription.subscription subscription) {
        this.subscription = subscription;
    }

    public enum subscription{
        daily, monthly1, monthly2, monthly3
    }

    private subscription subscription;
    private int price;
}
