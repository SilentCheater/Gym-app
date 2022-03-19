package model;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

public class Trainee extends Person{
    private int weight;
    private Date subscription_due_date;
    private Trainer trainer;
    private Subscription subscription;
    private String password;

    //TODO: implement those 3 - probably in controller
    private void requestTrainer(){}

    private void requestTraining(){}

    private void buySupplies(){}

    public Subscription getSubscription() {
        return subscription;
    }

    public void setSubscription(Subscription subscription) {
        this.subscription = subscription;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public Date getSubscription_due_date() {
        return subscription_due_date;
    }

    public Date setSubscription_due_date(Subscription subscription) {

        LocalDate curr = LocalDate.now();

        switch(subscription.getSubscription().ordinal()){
            case 0: curr.plusDays(1); break;
            case 1: curr.plusMonths(1); break;
            case 2: curr.plusMonths(2);break;
            case 3: curr.plusMonths(3);break;
            default: break;
        }
        ZoneId defaultZoneId = ZoneId.systemDefault();
        Date date = Date.from(curr.atStartOfDay(defaultZoneId).toInstant());

        return date;
    }

    public java.sql.Date getSQLDate(){
        java.sql.Date sqlDate = new java.sql.Date(this.subscription_due_date.getTime());
        return sqlDate;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
