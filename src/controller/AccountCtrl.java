package controller;

import model.Supplement;
import model.Trainee;
import model.Trainer;
import view.AccountView;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountCtrl implements ActionListener {


    private final String password = "1234";
    private final String user = "postgres";
    private final String url = "jdbc:postgresql://localhost:5432/gym";
    private final Trainee trainee;
    private int price;
    private final ArrayList<Supplement> supplementArrayList = getSupplementsFromDatabase();
    private final ArrayList<Trainer> trainerArrayList = getTrainersFromDatabase();
    private final AccountView accountView = new AccountView(supplementArrayList, trainerArrayList);

    public AccountCtrl(Trainee trainee) {
        this.trainee = trainee;
        accountView.setTitle(this.trainee.getFullName());
        accountView.getWeight().setText(String.valueOf(trainee.getWeight()));
        accountView.getWeight().setEditable(false);
        accountView.addCheckBoxListener(accountView.getEditWeight(), this);
        accountView.addListener(accountView.getAddSupplementToCart(), this);
        accountView.addListener(accountView.getTraining(), this);
        accountView.addListener(accountView.getPay(), this);
        accountView.addListener(accountView.getSubmitWeight(), this);
        //maybe some listeners too - for submit and idk
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == accountView.getSubmitWeight() && accountView.getCheckboxResponse()) {
           try {
               trainee.setWeight(Integer.parseInt(accountView.getWeight().getText()));
               accountView.setWeightLB(trainee.getWeight());
               accountView.getEditWeight().setSelected(false);
               accountView.getWeight().setEditable(false);
               updateWeight(trainee, Integer.parseInt(accountView.getWeight().getText()));
           }catch(NumberFormatException nfex)
           {
               JOptionPane.showMessageDialog(null, "Please insert a number!", "BAD INPUT", JOptionPane.ERROR_MESSAGE);
           }
        }

        if (e.getSource() == accountView.getEditWeight())
            accountView.getWeight().setEditable(accountView.getCheckboxResponse());

        if (e.getSource() == accountView.getTraining()) {
            updateTrainer(trainee, trainerArrayList.get(accountView.getTrainers().getSelectedIndex()), trainerArrayList);
            accountView.getTrainingLB().setText(getRoutineFromDatabase(trainee.getTrainer()));
            System.out.println(getRoutineFromDatabase(trainee.getTrainer()));
        }

        if (e.getSource() == accountView.getAddSupplementToCart()) {
            price = price + supplementArrayList.get(accountView.getSupplements().getSelectedIndex()).getPrice();
            accountView.setCost(String.valueOf(price));
        }
        if(e.getSource()==accountView.getPay())
            accountView.setCost("");
    }

    public ArrayList<Supplement> getSupplementsFromDatabase() {
        ArrayList<Supplement> supplementArrayList = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(url, user, password);
             PreparedStatement pst = con.prepareStatement("SELECT * FROM supplements");
             ResultSet rs = pst.executeQuery()) {


            while (rs.next()) {
                Supplement supplement = new Supplement();
                supplement.setName(rs.getString(2));
                supplement.setPrice(rs.getInt(4));
                supplementArrayList.add(supplement);
            }


        } catch (SQLException ex) {

            Logger lgr = Logger.getLogger(AccountCtrl.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        }

        return supplementArrayList;
    }


    public ArrayList<Trainer> getTrainersFromDatabase() {
        ArrayList<Trainer> trainersArrayList = new ArrayList<>();
        try (Connection con = DriverManager.getConnection(url, user, password);
             PreparedStatement pst = con.prepareStatement("SELECT * FROM trainers");
             ResultSet rs = pst.executeQuery()) {
            //trainersArrayList = new ArrayList<>();


            while (rs.next()) {

                Trainer trainer = new Trainer();
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

    public Connection connect() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    public int updateTrainer(Trainee trainee, Trainer trainer, ArrayList<Trainer> trainerArrayList) {
        String SQL = "UPDATE trainees "
                + "SET id_trainer = ? "
                + "WHERE trainee_name = ?";

        int affectedrows = 0;
        int index = trainerArrayList.indexOf(trainer) + 1;


        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            pstmt.setInt(1, index);
            pstmt.setString(2, trainee.getFullName());

            trainee.setTrainer(trainer);

            affectedrows = pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return affectedrows;
    }

    public int updateWeight(Trainee trainee, int weight) {
        String SQL = "UPDATE trainees "
                + "SET weight = ? "
                + "WHERE trainee_name = ?";

        int affectedrows = 0;

        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            pstmt.setInt(1, weight);
            pstmt.setString(2, trainee.getFullName());

            trainee.setWeight(weight);

            affectedrows = pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return affectedrows;
    }

    public String getRoutineFromDatabase(Trainer trainer) {
        try (Connection con = DriverManager.getConnection(url, user, password);
             PreparedStatement pst = con.prepareStatement("SELECT * FROM trainers");
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {

                if (trainer.getFullName().equals(rs.getString(2)))
                    return rs.getString(6);
            }

        } catch (SQLException ex) {

            Logger lgr = Logger.getLogger(AccountCtrl.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        }
        return null;
    }
}


