package controller;

import model.Subscription;
import model.Trainee;
import model.Trainer;
import view.AccountView;
import view.MainView;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MainCtrl implements ActionListener {
    private MainView mainView = new MainView();
    private final String password = "1234";
    private final String user = "postgres";
    private final String url = "jdbc:postgresql://localhost:5432/gym";

    ArrayList<Subscription> subscriptionArrayList = new ArrayList<>();
    public MainCtrl(){

        Subscription subscription1 = new Subscription();
        subscription1.setSubscription(Subscription.subscription.daily);
        subscription1.setPrice(10);

        Subscription subscription2 = new Subscription();
        subscription2.setSubscription(Subscription.subscription.monthly1);
        subscription2.setPrice(40);

        Subscription subscription3 = new Subscription();
        subscription3.setSubscription(Subscription.subscription.monthly2);
        subscription3.setPrice(80);

        Subscription subscription4 = new Subscription();
        subscription4.setSubscription(Subscription.subscription.monthly3);
        subscription4.setPrice(100);

        subscriptionArrayList.add(subscription1);
        subscriptionArrayList.add(subscription2);
        subscriptionArrayList.add(subscription3);
        subscriptionArrayList.add(subscription4);

        mainView.getRegister().addActionListener(this);
        mainView.getLogin().addActionListener(this);
    }


    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==mainView.getRegister()) {
            RegisterCtrl registerCtrl = new RegisterCtrl(subscriptionArrayList);
            mainView.dispose();
        }
        else{
            Trainee trainee = new Trainee();
            trainee.setFullName(mainView.getUsernameTF().getText());
            trainee.setPassword(String.valueOf(mainView.getPasswordField().getPassword()));
            if(checkExistence(trainee)){
                JOptionPane.showMessageDialog(null, "Successful login", "LOGGED IN", JOptionPane.INFORMATION_MESSAGE);
                AccountCtrl accountCtrl = new AccountCtrl(trainee);
                mainView.dispose();
            }
            else JOptionPane.showMessageDialog(null, "Wrong credentials", "CREDENTIALS", JOptionPane.ERROR_MESSAGE);
            }
        }
    public boolean checkExistence(Trainee trainee) {
        try (Connection con = DriverManager.getConnection(url, user, password);
             PreparedStatement pst = con.prepareStatement("SELECT * FROM trainees");
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                if(trainee.getFullName().equals(rs.getString(2)) && trainee.getPassword().equals(rs.getString(8))){
                    trainee.setWeight(rs.getInt(4));
                    trainee.setAge(rs.getInt(3));
                    trainee.setTrainer(getTrainersFromDatabase().get(rs.getInt(5)));
                    trainee.setSubscription(subscriptionArrayList.get(rs.getInt(6)));
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(AccountCtrl.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        }
        return false;
    }

    public ArrayList<Trainer> getTrainersFromDatabase() {
        ArrayList<Trainer> trainersArrayList = null;
        try (Connection con = DriverManager.getConnection(url, user, password);
             PreparedStatement pst = con.prepareStatement("SELECT * FROM trainers");
             ResultSet rs = pst.executeQuery()) {
            trainersArrayList = new ArrayList<>();
            Trainer trainer = new Trainer();

            while (rs.next()) {

                trainer.setFullName(rs.getString(2));
                trainer.setAge(rs.getInt(3));
                trainer.setWage(rs.getInt(4));
                trainer.setExperience(rs.getInt(5));
                trainersArrayList.add(trainer);
            }


        } catch (SQLException ex) {

            Logger lgr = Logger.getLogger(AccountCtrl.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        }

        return trainersArrayList;
    }

}
